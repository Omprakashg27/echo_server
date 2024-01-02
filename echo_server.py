from http.server import SimpleHTTPRequestHandler, HTTPServer
import socket

class MyHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path.startswith('/index.html'):
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            with open('index.html', 'rb') as file:
                self.wfile.write(file.read())
        elif self.path.startswith('/localip'):
            ip_address = self.get_local_ip()
            self.send_response(200)
            self.send_header('Content-type', 'text/plain')
            self.end_headers()
            self.wfile.write(ip_address.encode())
        else:
            echo_string = self.path[1:]
            ip_address = self.get_local_ip()
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            response_content = f"Echo: {echo_string}<br>Local IP: {ip_address}"
            self.wfile.write(response_content.encode())

    def get_local_ip(self):
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('8.8.8.8', 80))
        local_ip = s.getsockname()[0]
        s.close()
        return local_ip

if __name__ == '__main__':
    server_address = ('', 8080)
    httpd = HTTPServer(server_address, MyHandler)
    print('Server running on port 8080...')
    httpd.serve_forever()
