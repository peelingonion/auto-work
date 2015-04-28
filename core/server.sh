#!/bin/bash

cat >> /etc/sysctl.conf << "EOF"
fs.file-max = 999999
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_keepalive_time = 600 
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.ip_local_port_range = 1024   61000
net.ipv4.tcp_rmem = 4096 32768  262142
net.ipv4.tcp_wmem = 4096 32768  262142
net.core.netdev_max_backlog = 8096
net.core.rmem_default = 262144
net.core.wmem_default = 262144
net.core.rmem_max = 2097152
net.core.wmem_max = 2097152
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_max_syn_backlog=1024
EOF

sudo sysctl -p
