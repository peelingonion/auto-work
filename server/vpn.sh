sudo apt-get install -y pptpd
sudo bash -c "echo \
		 'localip 192.168.0.1
		 remoteip 192.168.0.100-200' >> /etc/pptpd.conf"
sudo bash -c "echo \
		 'ms-dns 202.101.224.68
		 ms-dns 8.8.8.8' >> /etc/ppp/pptpd-options"

sudo bash -c "echo 'howpay * howpay4you *'  >> /etc/ppp/chap-secrets"

sudo bash -c "echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf"

sudo sysctl -p

sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -p tcp --syn -s 192.168.0.0/24 -j TCPMSS --set-mss 1356

sudo bash -c "echo 'iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE
iptables -A FORWARD -p tcp --syn -s 192.168.0.0/24 -j TCPMSS --set-mss 1356' >> /etc/rc.local"

sudo /etc/init.d/pptpd restart 
