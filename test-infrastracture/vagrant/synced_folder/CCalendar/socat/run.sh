#!/bin/sh

SOCAT_SOCKADDR=10.60.38.1 socat OPENSSL-LISTEN:8443,reuseaddr,fork,cert=cert.pem,key=key.pem,verify=0 TCP4:10.60.38.1:9090 &
SOCAT_SOCKADDR=10.60.38.1 socat TCP4-LISTEN:9090,reuseaddr,fork OPENSSL:10.60.38.1:8553,verify=0 &

sleep 999999 # never exit (actually exits after all that seconds)
