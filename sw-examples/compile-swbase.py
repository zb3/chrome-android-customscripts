import sys
import re
import os
import json
import base64
import subprocess

# this will try to strip comments using uglify-es, if available

#actually stdio 'd be better
input_file = sys.argv[1]
output_file = sys.argv[2]

try:
  source_base = sys.argv[3]
except IndexError:
  source_base = '.'


install_pat = re.compile(r'^// @install\s+(?P<localfile>[^\s]+)\s+(?P<route>.+)\s+(?P<mime>[^\s]+)\s*$')
realsw_pat = re.compile(r'^// @real-serviceworker\s+(?P<url>[^\s]+)\s*$')
inject_pat = re.compile(r'^// @inject\s+(?P<localscript>[^\s]+)\s*$')
source_file = os.path.join(source_base, 'swbase.src.js')


def js_regex_escape(s):
  return re.sub(r'[.*+?^${}()|[\]\\]', '\\\\\\g<0>', s)
  
def localfile(name):
  # the file might not be utf8 encoded

  with open(name, 'rb') as f:
    content = f.read()
  
  return 'base64ToBuffer(%s)' % json.dumps(base64.b64encode(content).decode('ascii'))
  
def localscript(name):
  with open(name, 'r') as f:
    content = f.read()
  
  return json.dumps(content)
 
normal_block = ''

#def and use blocks are wrapped in braces to introduce a new block scope
#so that their constants cause no trouble

def_block = 'const __files = {};'
use_block = ''

file_defs = {}

init_block = ''
init_block_done = False
realsw_block = ''

with open(input_file) as f:
  for line in f:
    is_directive = line.startswith('// @')

    if not is_directive:
      normal_block += line
      continue
      
    match = install_pat.match(line)
    if match:
      #we always use regex, conversion to urlRegex is not approporiate here
    
      route = match['route']
      route_flags = ''
      
      if route.startswith('#'):
        route_flags = route[route.rindex('#')+1:]
        route = '^'+route[1:route.rindex('#')]+'$'  
        
      route_type = 'path' if route.startswith('/') or route.startswith('^/') else 'url'
      route = '%s(new RegExp(%s, %s))' % (route_type, json.dumps(route), route_flags)
        
      if match['localfile'] not in file_defs:
        file_def = '__files[%s]' % json.dumps(match['localfile'])
        file_defs[match['localfile']] = file_def 
        
        def_block += '%s = %s;' % (file_def, localfile(match['localfile']))
      
      line = 'urlReplacePatterns.push([%s, %s, %s]);' % (route,
              file_defs[match['localfile']], json.dumps(match['mime']))

    if not match:
      match = inject_pat.match(line)
      if match:    
        line = 'injectScripts.push(%s);' % localscript(match['localscript'])

    if match:
      use_block += line

    if not match and line.startswith('// @serviceworker'):
      init_block += line
    elif not match:
      match = realsw_pat.match(line)
      if match:
        realsw_block += 'importScripts(%s);\n' % json.dumps(match['url']);
    

with open(source_file) as f:
  with open(output_file, 'w') as out_file:
    for line in f:
      if line == '/* HEADER HERE */\n':
        out_file.write(init_block)

      elif line == '/* COMPILED CODE HERE */\n':
        out_file.write(normal_block)
        out_file.write('\n{\n')
        out_file.write(def_block)
        out_file.write(use_block)
        out_file.write('\n}\n')

      elif line == '/* IMPORTS HERE */\n':
        out_file.write(realsw_block)

      else:
        out_file.write(line)

  print('compile ok')
  #now we'll try to strip comments using uglify-es, if installed
  """
  result = subprocess.run(['uglifyjs', output_file, '--comments', '/^ @serv/'], 
      stdout=subprocess.PIPE, stderr=subprocess.PIPE)

  if not result.returncode:
    print('uglify ok')

    with open(output_file, 'wb') as out_file:
      out_file.write(result.stdout)
  """
