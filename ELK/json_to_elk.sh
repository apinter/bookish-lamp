#!/bin/bash

rm -f /tmp/events-bulk.json
echo -n "Indexing $1 "
while read LINE; do
	echo '{"index":{"_index":"devicesum","_type":"event"}}' >> /tmp/events-bulk.json
	echo $LINE >> /tmp/events-bulk.json
done <"$1"
curl -XPUT localhost:9200/_bulk --data-binary @/tmp/events-bulk.json >/dev/null
#curl -XPUT --data-binary @/tmp/events-bulk.json 'localhost:9200/_bulk' >/dev/null
rm /tmp/events-bulk.json
echo "  done"

