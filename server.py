#!/usr/bin/env python3
"""
UXR No-Show Tracker - Local Server
Zero dependencies, Python 3 only (built-in on macOS).
Serves the dashboard and provides API endpoints to read/write data.json.
"""

import json
import os
import sys
from http.server import HTTPServer, SimpleHTTPRequestHandler
from urllib.parse import urlparse

PORT = 7272
DATA_FILE = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'data.json')


def load_data():
    try:
        with open(DATA_FILE, 'r') as f:
            return json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        return {"entries": []}


def save_data(data):
    with open(DATA_FILE, 'w') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)


class Handler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        # Serve files from the script's directory
        super().__init__(*args, directory=os.path.dirname(os.path.abspath(__file__)), **kwargs)

    def do_GET(self):
        parsed = urlparse(self.path)
        if parsed.path == '/api/entries':
            data = load_data()
            self._json_response(data)
        elif parsed.path == '/':
            self.path = '/index.html'
            super().do_GET()
        else:
            super().do_GET()

    def do_POST(self):
        parsed = urlparse(self.path)
        if parsed.path == '/api/entries':
            length = int(self.headers.get('Content-Length', 0))
            body = json.loads(self.rfile.read(length))

            member = body.get('member', '')
            date = body.get('date', '')

            if member not in ['Anna', 'Aleja', 'Hector', 'Pablo'] or not date:
                self._json_response({"error": "Invalid data"}, 400)
                return

            data = load_data()
            data['entries'].append({"member": member, "date": date})
            save_data(data)
            self._json_response(data)
        else:
            self._json_response({"error": "Not found"}, 404)

    def do_DELETE(self):
        parsed = urlparse(self.path)
        parts = parsed.path.strip('/').split('/')

        if len(parts) == 3 and parts[0] == 'api' and parts[1] == 'entries':
            try:
                index = int(parts[2])
                data = load_data()
                if 0 <= index < len(data['entries']):
                    data['entries'].pop(index)
                    save_data(data)
                    self._json_response(data)
                else:
                    self._json_response({"error": "Index out of range"}, 400)
            except ValueError:
                self._json_response({"error": "Invalid index"}, 400)
        else:
            self._json_response({"error": "Not found"}, 404)

    def do_OPTIONS(self):
        self.send_response(200)
        self._cors_headers()
        self.end_headers()

    def _json_response(self, data, status=200):
        body = json.dumps(data, ensure_ascii=False).encode('utf-8')
        self.send_response(status)
        self.send_header('Content-Type', 'application/json')
        self._cors_headers()
        self.end_headers()
        self.wfile.write(body)

    def _cors_headers(self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, DELETE, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')

    def log_message(self, format, *args):
        # Quieter logging
        if '/api/' in str(args[0]):
            sys.stderr.write(f"  API: {args[0]}\n")


if __name__ == '__main__':
    print(f"""
    ╔══════════════════════════════════════╗
    ║   UXR No-Show Tracker               ║
    ║   http://localhost:{PORT}              ║
    ║                                      ║
    ║   Ctrl+C para cerrar                 ║
    ╚══════════════════════════════════════╝
    """)

    server = HTTPServer(('localhost', PORT), Handler)
    try:
        import webbrowser
        webbrowser.open(f'http://localhost:{PORT}')
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nServer cerrado.")
        server.server_close()
