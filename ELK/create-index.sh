curl -X POST --data-binary @- localhost:9200/devicesum <<EOF
{
  "mappings": {
    "_default_": {
      "properties": {
        "timestamp": {"type": "date", "format": "yyy-MM-dd HH:mm:ss"},
	"event" : {"type": "string" },
	"age" : {"type" : "integer" },
	"gender" : {"type" : "string" },
	"smile" : {"type" : "boolean" },
	"source" : {"type" : "string", "index" : "not_analyzed" }
      }
    }
  }
}
EOF

