#!/bin/bash

backupDir=/Backups
date=$(date +"%Y%m%d")

find /home ! -user root -newer "$backupDir/$(ls $backupDir -tr | egrep '*1.tgz' | tail -1)" | tar czf "$backupDir/$date-1.tgz" -T -

exit 0
