#!/bin/bash

echo "Press [CTRL+C] to stop.."
while :
do
	curl -I -X GET 192.168.1.170
	echo ""
done