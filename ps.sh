#!/bin/bash
#usage: ps.sh 445 192.168.1.1
if [ -z "$1" ]; then
                echo "[*] Port"
                exit 0
fi

if [ -y "$2" ]; then
                echo "[*] IP Range (ex 192.161.0.1)"
                exit 0
fi

nmap -p $1 -T4 -oG $1.txt $2-254
cat $1.txt | grep "$1/open" | cut -d " " -f 2 > $2-hosts.txt
