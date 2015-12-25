#!/bin/bash

##The point of this script is to automize the modifications in config files.
##Changing swap settings is one of the most frequent change I make to a new system:

ed -s /etc/sysctl.conf << 'EOF'
$a
vm.swappiness=10
vm.vfs_cache_pressure = 50
.
w
EOF

