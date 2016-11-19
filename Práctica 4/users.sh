#!/bin/bash

function createGroup(){
	groupadd -f myusers
	mkdir -p /Users/myusers
	chmod a-rwx,g+rwx /Users/myusers
	chgrp myusers /Users/myusers
}

function createPoweruser(){
	useradd -g myusers -M user00
	gpasswd -A user00 myusers
}

function createUsers(){
	for i in $(seq -f "%02g" 1 40)
	do
		useradd -g myusers -m -d /Users/user$i user$i
		chage -M 30 -m 15 -W 7 -I 7 user$i
	done
}

createGroup
createPoweruser
createUsers
exit 0
