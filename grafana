grafana on ubuntu
Grafana: http://<server-ip>:3000
-------------------------------
#!/bin/bash

sudo apt update -y
sudo apt install -y software-properties-common wget apt-transport-https

# Add Grafana GPG key
wget -q -O - https://apt.grafana.com/gpg.key | \
sudo gpg --dearmor -o /usr/share/keyrings/grafana.gpg

# Add repository
echo "deb [signed-by=/usr/share/keyrings/grafana.gpg] https://apt.grafana.com stable main" | \
sudo tee /etc/apt/sources.list.d/grafana.list

# Install Grafana
sudo apt update -y
sudo apt install -y grafana

# Start service
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

sudo systemctl status grafana-server
