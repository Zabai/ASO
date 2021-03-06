#!/bin/bash

backupDir=/Backups
date=$(date +"%Y%m%d")

find /home ! -user root -type f -newer "$backupDir/$(ls $backupDir -tr | egrep '*0.cpio' | tail -1)" | cpio -o > "$backupDir/$date-1.cpio"

exit 0
