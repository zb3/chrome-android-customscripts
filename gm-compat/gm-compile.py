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

  input_url = input if '//' in input else None

  def open_input():
    if input_url:
      return urllib.request.urlopen(input_url)
    else:
      return open(input, 'rb')

  with open(output, 'wb') as wf:
    dependencies = []
    file_content = None
    attributes = {}
    resources = {}

    with open_input() as f:
      for line in f:
        attr_match = attribute_pat.match(line)
        if attr_match:
          name = attr_match[1].decode('ascii')
          value = attr_match[2].decode('utf8')

          attributes[name] = value

          if name == 'require':
            dependencies.append(value)
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
      content, ctype = fetch_resource(loc, input_url)
      resources[res_name] = 'data:'+ctype+';base64,'+base64.b64encode(content).decode('ascii')

    if b'GM_' in file_content or b'GM.' in file_content or b'unsafeWindow' in file_content:
      with open(shim_file, 'rb') as shim:
        add_content(wf, compile_shim(shim.read(), attributes, resources))
      
    for loc in dependencies:
      content, _ = fetch_resource(loc, input_url)
      add_content(wf, content)

    add_content(wf, file_content)

    wf.write(b'\n})();')


def fetch_resource(loc, base_url=None):
  content, ctype = b'', 'application/octet-stream'
  
  url = None

  if '//' not in loc:
    if base_url:
      url = urllib.parse.urljoin(base_url, loc)
  else:
    url = loc
  
  if url:
    print('Downloading', url)
    with urllib.request.urlopen(url) as response:
      content = response.read()
      ctype = response.headers['content-type']
      
  else:
    with open(loc, 'rb') as rf:
      content = rf.read()
        
  return content, ctype


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




