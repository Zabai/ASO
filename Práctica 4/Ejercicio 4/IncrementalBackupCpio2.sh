#!/bin/bash

backupDir=/Backups
date=$(date +"%Y%m%d")

find /home ! -user root -type f -newer "$backupDir/$(ls $backupDir -tr | egrep '*1.cpio' | tail -1)" | cpio -o > "$backupDir/$date-2.cpio"

exit 0
