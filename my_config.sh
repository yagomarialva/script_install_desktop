#!/bin/bash
set -e
apt --fix-broken install
sudo apt-get install libgconf-2-4
apt-get update && apt-get install -y net-tools iproute2 curl git-all


curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
curl -fsSL https://get.docker.com/ | sh

usermod -aG docker $1

git config --global user.name "yagomarialva"
git config --global user.email yago.marialva@gmail.com

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/

sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

apt install apt-transport-https
apt update
apt install code # or code-insiders

wget https://downloads.mongodb.com/compass/mongodb-compass_1.29.6_amd64.deb

dpkg -i mongodb-compass_1.29.6_amd64.deb

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash




