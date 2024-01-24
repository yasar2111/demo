#!/bin/bash
set -eo
mkdir -p node_exporter
cd node_exporter || exit 1
wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz
tar xvfz node_exporter-1.7.0.linux-amd64.tar.gz
sudo cp node_exporter-1.7.0.linux-amd64/node_exporter /usr/local/bin/node_exporter
rm -f node_exporter-1.7.0.linux-amd64.tar.gz
sudo tee /etc/systemd/system/node_exporter.service <<EOF
[Unit]
Description=Node Exporter
After=network.target
[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
[Install]
WantedBy=multi-user.target
EOF
sudo chmod +x /usr/local/bin/node_exporter
sudo useradd -rs /bin/false node_exporter
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
sudo systemctl status node_exporter



this is edited file
