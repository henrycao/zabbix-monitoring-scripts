#!/usr/bin/env python
from socket import * 

HOST = '127.0.0.1'
PORT = 4346
BUFSIZE = 1024
ADDR = (HOST,PORT)
RESULT="[[0]]\n"

def tcp_connect():
	s = socket(AF_INET,SOCK_STREAM)
	s.connect(ADDR)
	s.send("21\r\n")
	recv = s.recv(BUFSIZE)
	s.close()
	if recv == RESULT:
		print "1"
	else:
		print "0"

tcp_connect()
