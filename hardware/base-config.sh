# basic
apt-get update
apt-get upgrade -y

# Network
# manually adding to /etc/hosts:
# 192.168.1.1   slice1
# 192.168.1.2   slice2
hostname $1

# docker
curl -sSL https://get.docker.com | sh

# non su 
usermod -aG docker pi