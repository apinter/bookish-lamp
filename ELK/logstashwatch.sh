#!/bin/bash

while :
do
for i in $(service logstash status | grep 'not running' | wc -l); do
        if [ $i == 1 ]; then
        service logstash restart && echo "$(date) Logstash service restarted" >> /var/log/lsvcwatch
fi
done
done


