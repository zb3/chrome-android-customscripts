import sys
import os
import re
import json
import base64
import urllib.request

#todo: encoding problems

shim_file = 'gm-shim.js'
if not os.path.exists(shim_file):
  shim_file = os.path.join(os.path.dirname(os.path.realpath(__file__)), shim_file)

attribute_pat = re.compile(br'^\s*//\s*@([a-zA-Z]+)\s*(.*\S)\s*$')
end_pat = re.compile(br'^(//\s*==/UserScript==)?\s*$')

#todo: only ? is escaped, but this is not enough
qm_pat = re.compile(r'(?<!\[)\?')

resource_pat = re.compile(r'^(\S+)\s*(\S+)$')

def main():
  input = sys.argv[1]
  output = sys.argv[2]

  with open(output, 'wb') as wf:
    required_urls = []
    file_content = None
    attributes = {}
    resources = {}

    with open(input, 'rb') as f:
      for line in f:
        attr_match = attribute_pat.match(line)
        if attr_match:
          name = attr_match[1].decode('ascii')
          value = attr_match[2].decode('utf8')

          attributes[name] = value

          if name == 'require':
            required_urls.append(value)
            continue

          if name == 'resource':
            res_match = resource_pat.match(value)
            res_name = res_match[1]
            res_url = res_match[2]
            resources[res_name] = res_url
            continue

          if name in ('url', 'match', 'include', 'exclude'):
            line = ('// @%s %s\n' % (name, url_compat(value))).encode('utf8')

        wf.write(line)

        if end_pat.match(line):
          break

      file_content = f.read()

    wf.write(b'\n(function(){')

    for res_name in resources:
      loc = resources[res_name]

      content, ctype = b'', 'application/octet-stream'

      if '//' not in loc:
        with open(loc, 'rb') as rf:
          content = rf.read()
      else:
        print('Downloading resource', loc)
        with urllib.request.urlopen(loc) as response:
          content = response.read()
          ctype = response.headers['content-type']

      resources[res_name] = 'data:'+ctype+';base64,'+base64.b64encode(content).decode('ascii')

    if b'GM_' in file_content or b'GM.' in file_content or b'unsafeWindow' in file_content:
      with open(shim_file, 'rb') as shim:
        add_content(wf, compile_shim(shim.read(), attributes, resources))
      
    for url in required_urls:
      print('Downloading', url)
      with urllib.request.urlopen(url) as response:
        add_content(wf, response.read())

    add_content(wf, file_content)

    wf.write(b'\n})();')

def url_compat(value):
  if value.startswith('/') and value.endswith('/'):
    return value
  
  return qm_pat.sub('[?]', value)

def compile_shim(content, attrs, resources):
  content = content.replace(b'/#ATTRS#/', json.dumps(attrs).encode('utf8'))
  content = content.replace(b'/#RESOURCES#/', json.dumps(resources).encode('utf8'))
  return content

def add_content(f, content):
  f.write(b'\n')
  f.write(content)
  f.write(b'\n')

if __name__ == '__main__':
  main()




