#!/bin/bash

backupDir=/Backups
date=$(date +"%Y%m%d")

find /home ! -user root -type f -newer "$backupDir/$(ls $backupDir -tr | egrep '*0.tgz' | tail -1)" | tar czf "$backupDir/$date-1.tgz" -T -

exit 0
