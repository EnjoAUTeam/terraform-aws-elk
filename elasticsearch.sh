#!/bin/bash

# Make sure every command send output. Also make sure, that the program exits after an error.
set -x

# To get the whole user_data output, we save it to a log file under /var/log/user_data.log
exec > >(tee /var/log/deploy.log|logger -t user-data -s 2>/dev/console) 2>&1

apt update
apt install openjdk-8-jdk -y

# install elasticsearch
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.8.0-amd64.deb
dpkg -i elasticsearch-7.8.0-amd64.deb

mv /tmp/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
systemctl daemon-reload
systemctl enable elasticsearch.service
systemctl start elasticsearch.service

# install kibana
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.8.0-amd64.deb
dpkg -i kibana-7.8.0-amd64.deb
sysctl -w vm.max_map_count=262144

mv /tmp/kibana.yml /etc/kibana/kibana.yml
systemctl daemon-reload
systemctl enable kibana.service
systemctl start kibana.service

# install logstash
wget https://artifacts.elastic.co/downloads/logstash/logstash-7.8.0.deb
dpkg -i logstash-7.8.0.deb

mv /tmp/logstash.yml /etc/logstash/logstash.yml
systemctl daemon-reload
systemctl start logstash.service
systemctl enable logstash.service

# install filebeats
/usr/share/logstash/bin/logstash-plugin install logstash-input-beats
/usr/share/logstash/bin/logstash-plugin install ingest-geoip

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.8.0-amd64.deb
dpkg -i filebeat-7.8.0-amd64.deb
mv /tmp/filebeat.yml /etc/filebeat/filebeat.yml

systemctl enable filebeat.service
systemctl start filebeat.service

mv /tmp/beats.conf /etc/logstash/conf.d/beats.conf
curl -XPUT 'http://127.0.0.1:9200/_template/filebeat' -d@/etc/filebeat/filebeat.template.json


