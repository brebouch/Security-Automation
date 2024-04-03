import os
import re
import socket
import ssl
import struct
import sys

DEFAULT_CRT_FILE = './server.crt'
DEFAULT_KEY_FILE = './server.key'


class SFHIClient:
    HI_TYPE_MAX_SIZE = 1
    HI_TYPE_VERSION = 2
    HI_TYPE_DATA = 3
    HI_TYPE_ERROR = 4

    def __init__(self):
        self.IPV6_THERE = hasattr(socket, 'AF_INET6')

    def newClient(self, server, port, crtfile, keyfile, proto):
        for file in [crtfile, keyfile]:
            if not os.path.exists(file):
                raise FileNotFoundError(f"Certificate file {file} does not exist")

        domain = socket.AF_INET if proto == "AF_INET" else socket.AF_INET6
        client = ssl.wrap_socket(socket.socket(domain, socket.SOCK_STREAM))
        client.connect((server, port))
        client.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        client.certfile = crtfile
        client.keyfile = keyfile
        return client

    def reformat(self, string):
        return re.sub(r'[,\"\n\cM]', lambda x: ' ' if x.group() == ',' else "'", string)

    def formatStrIDCmd(self, head, id_array, sub_head=None):
        sub_head = "" if sub_head is None else sub_head
        return head + ' '.join(sub_head + item for item in id_array)

    def addCSVCommand(self, cmd):
        return "\n" if cmd == 'ScanFlush' else f"{cmd}\n"

    def sendToServer(self, sock, type, size, data):
        ts = struct.pack('NN', type, size)
        sock.sendall(ts)
        if type == self.HI_TYPE_VERSION:
            v = struct.pack('N', data)
            sock.sendall(v)
        else:
            len_sent = 0
            while len_sent < size:
                len_sent += sock.send(data[len_sent:])

    def receiveFromServer(self, sock):
        t = self.getBinaryData(sock, 4)
        type = struct.unpack('N', t)[0]
        s = self.getBinaryData(sock, 4)
        size = struct.unpack('N', s)[0]
        if type == self.HI_TYPE_MAX_SIZE:
            text = struct.unpack('N', self.getBinaryData(sock, size))[0]
        else:
            text = self.getBinaryData(sock, size)
        return text

    def getBinaryData(self, sock, size):
        bytes_data = b''
        len_received = 0
        while len_received < size:
            chunk = sock.recv(size - len_received)
            if not chunk:
                sys.exit(0)
            bytes_data += chunk
            len_received += len(chunk)
        return bytes_data

    def mem_report(self):
        lines = os.popen('top -bn 1 -p $$').readlines()
        return ''.join(line for line in lines if 'PID' in line or str(os.getpid()) in line)
