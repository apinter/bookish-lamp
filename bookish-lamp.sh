#!/bin/bash

HOME_USER=Warlock
DEST=Arch
DISK=AuroraTerra

if mountpoint -q /run/media/$HOME_USER/AuroraTera/
	then
	echo "filesystem mounted >> STARTING BACKUP"
		rsync -av /home/$HOME_USER /run/media/$HOME_USER/$DISK/Backup/$DEST/home/$HOME_USER
		rsync -av /var /run/media/$HOME_USER/$DISK/Backup/$DEST/var
		rsync -av /etc /run/media/$HOME_USER/$DISK/Backup/$DEST/etc

	echo "Backup is finished"
##OPTIONAL - modify sudoers to don't ask password for shutdown
##sudo shutdown -h
	else
		echo "filesystem not mounted"
	fi
