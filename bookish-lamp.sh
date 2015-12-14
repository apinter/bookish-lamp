#!/bin/bash

HOME_USER=Warlock
DEST=Arch
DISK=AuroraTerra

if mountpoint -q /run/media/$HOME_USER/AuroraTera/
then
echo "filesystem mounted"
rsync -av /home/$HOME_USER /run/media/$HOME_USER/$DISK/Backup/$DEST/home/$HOME_USER
rsync -av /var /run/media/$HOME_USER/$DISK/Backup/$DEST/var
rsync -av /etc /run/media/$HOME_USER/$DISK/Backup/$DEST/etc


else
echo "filesystem not mounted"
fi
