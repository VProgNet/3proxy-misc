#!/bin/bash
echo "" > /usr/local/3proxy/logs/proxy.log
echo "" > /usr/local/3proxy/logs/socks.log
echo "" > /usr/local/3proxy/logs/3proxy.log

/etc/init.d/3proxy restart
echo "current configuration: /etc/3proxy/3proxy.cfg"
cat /etc/3proxy/3proxy.cfg
