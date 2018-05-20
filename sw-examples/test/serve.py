from http.server import *

class HTTPHandler(SimpleHTTPRequestHandler):
  def do_GET(self):
    if self.path == '/headers':
      response = ''

      for k in self.headers:
        response += '%s: %s\n' % (k, self.headers[k])

      response = response.encode('utf8')

      self.send_response(200)
      self.send_header('Content-type', 'text/plain')
      self.send_header('Content-length', len(response))
      self.end_headers()

      self.wfile.write(response)
    else:
      SimpleHTTPRequestHandler.do_GET(self)

  def do_POST(self):
    # reflect what we've got
    
    # using content-length is not a good idea...
    response = self.rfile.read(int(self.headers['Content-Length']))

    self.send_response(200)
    self.send_header('Content-type', self.headers.get('content-type', 'text/plain'))
    self.send_header('Content-length', len(response))
    self.end_headers()

    self.wfile.write(response)

  def end_headers(self):
    if self.path == '/csp-test.html':
      self.send_header('Content-Security-Policy',
          "default-src 'self'; script-src 'self' 'nonce-ogaboga123'")
    
    SimpleHTTPRequestHandler.end_headers(self)

print('http://localhost:4000/')

httpd = HTTPServer(('', 4000), HTTPHandler)
httpd.serve_forever()



