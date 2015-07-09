#!/bin/bash

# this script just for ubuntu, use this shell as: sudo init.sh by you work user

#update system
sudo apt-get update

# install tmux -y
sudo apt-get install tmux

# install vim
sudo apt-get install vim

touch ~/.bashrc
echo 'export EDITER=vim' >> ~/.bashrc
. ~/.bashrc

wget https://raw.githubusercontent.com/peelingonion/auto-work/config-file/.vimrc -O ~/.vimrc

# install mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 --yes
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org

# install redis
sudo apt-get install -y redis-server

#install nodejs & npm
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update -y
sudo apt-get install -y nodejs

# install some node packages such as pm2
sudo npm install  pm2 -g
sudo npm install express-generator -g

# install some python packages
wget https://bootstrap.pypa.io/get-pip.py -O ./get_pip.py
sudo python get-pip.py
sudo pip install celery

# install nginx
sudo apt-get install -y nginx

# install git
sudo apt-get install -y git
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

bash -c "echo \
		 'if [ -f ~/.git-completion.bash ]; then
		   . ~/.git-completion.bash
		   fi
		 '
		 >> .bashrc"

source ~/.bashrc

# ssh config
sudo bash -c "echo '    ServerAliveInterval 30
    ServerAliveCountMax 30' >> /etc/ssh/ssh_config"

sudo bash -c "echo '    ClientAliveInterval 30
    ClientAliveCountMax 300' >> /etc/ssh/sshd_config"


# install sysv-rc-conf
sudo apt-get install -y sysv-rc-conf

# install zsh
sudo apt-get install zsh -y
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh


