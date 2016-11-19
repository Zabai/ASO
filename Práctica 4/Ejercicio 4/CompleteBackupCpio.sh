#!/bin/bash

backupDir=/Backups
date=$(date +"%Y%m%d")

if [[ ! -d $backupDir ]]
then
	mkdir $backupDir
fi

find /home ! -user root | cpio -o > "$backupDir/$date-0.cpio"

exit 0
