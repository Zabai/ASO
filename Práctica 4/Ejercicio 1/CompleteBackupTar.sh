#!/bin/bash

backupDir=/Backups
date=$(date +"%Y%m%d")

if [[ ! -d $backupDir ]]
then
	mkdir $backupDir
fi

find ~prueba ~invitado | tar czf "$backupDir/$date-0.tgz" -T -

exit 0
