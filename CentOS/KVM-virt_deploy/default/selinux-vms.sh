#!/bin/bash

mkdir /home/VMs/iso
semanage fcontext --add -t virt_image_t '/home/VMs(/.*)?'
restorecon -R -v /home/VMs
setsebool -P virt_use_samba 1
setsebool -P virt_use_nfs 1
echo 'Securtiy context for the "VMs" directory has been set'
echo 'Setting SELinux Booleans for NFS/smb share is done'
