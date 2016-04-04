#!/bin/bash

#add repos
sudo add-apt-repository -y ppa:webupd8team/java
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
echo "deb http://packages.elastic.co/kibana/4.4/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana-4.4.x.list
echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | sudo tee /etc/apt/sources.list.d/logstash-2.2.x.list

#install ELK

sudo apt-get update && sudo apt-get install nginx apache2-utils kibana logstash elasticsearch oracle-java8-installer
	sudo update-rc.d elasticsearch defaults 95 10
	sudo update-rc.d kibana defaults 96 9
	sudo update-rc.d logstash defaults 96 9

#Create certs
#sudo vi /etc/ssl/openssl.cnf
#@ [ v3_ca ] edit subjectAltName = IP: ELK_server_private_IP

sudo mkdir -p /etc/pki/tls/certs
sudo mkdir /etc/pki/tls/private
cd /etc/pki/tls && sudo openssl req -config /etc/ssl/openssl.cnf -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt

## post-install configs
#[Elasticsearch]
#	elastic.yml network.host: localhost
#[Kibana]
#	sudo vi /opt/kibana/config/kibana.yml >> server.host: "localhost"
#[Nginx]
#	htpasswd -c /etc/nginx/htpasswd.users kibanaadmin
#	edit /etc/nginx/sites-available/default
#    server {
#        listen 80;

#        server_name example.com;

#        auth_basic "Restricted Access";
#        auth_basic_user_file /etc/nginx/htpasswd.users;

#        location / {
#            proxy_pass http://localhost:5601;
#            proxy_http_version 1.1;
#            proxy_set_header Upgrade $http_upgrade;
#            proxy_set_header Connection 'upgrade';
#            proxy_set_header Host $host;
#            proxy_cache_bypass $http_upgrade;        
#        }
#    }
#[Logstash]
#	with beats: sudo vi /etc/logstash/conf.d/02-beats-input.conf
#    input {
#      beats {
#        port => 5044
#        ssl => true
#        ssl_certificate => "/etc/pki/tls/certs/logstash-forwarder.crt"
#        ssl_key => "/etc/pki/tls/private/logstash-forwarder.key"
#      }
#    }


#	sudo vi /etc/logstash/conf.d/10-syslog-filter.conf	
#    filter {
#      if [type] == "syslog" {
#        grok {
#          match => { "message" => "%{SYSLOGTIMESTAMP:syslog_timestamp} %{SYSLOGHOST:syslog_hostname} %{DATA:syslog_program}(?:\[%{POSINT:syslog_pid}\])?: %{GREEDYDATA:syslog_message}" }
#          add_field => [ "received_at", "%{@timestamp}" ]
#          add_field => [ "received_from", "%{host}" ]
#        }
#        syslog_pri { }
#        date {
#          match => [ "syslog_timestamp", "MMM  d HH:mm:ss", "MMM dd HH:mm:ss" ]
#        }
#      }
#    }

#	sudo vi /etc/logstash/conf.d/30-elasticsearch-output.conf
#    output {
#      elasticsearch {
#        hosts => ["localhost:9200"]
#        sniffing => true
#        manage_template => false
#        index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"
#        document_type => "%{[@metadata][type]}"
#      }
#    }

