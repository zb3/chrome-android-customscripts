from http.server import *
from threading import Thread

def MakeHTTPHandler(prefix):
  class HTTPHandler(SimpleHTTPRequestHandler):
    def translate_path(self, path):
      #note: this is insecure, ../ can be used
      path = prefix + path 
      path = SimpleHTTPRequestHandler.translate_path(self, path)
      return path

  return HTTPHandler



def serve(port, path):
  httpd = HTTPServer(('', port), MakeHTTPHandler(path))
  httpd.serve_forever()

Thread(target=serve, args=(4000,'/client')).start()
Thread(target=serve, args=(4001,'/agent')).start()

print('Client is @ http://localhost:4000/')
