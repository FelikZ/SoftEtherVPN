#!/bin/bash

yum -y update \
  && yum -y groupinstall "Development Tools" \
  && yum -y install readline-devel ncurses-devel openssl-devel

git clone https://github.com/SoftEtherVPN/SoftEtherVPN.git /usr/local/src/vpnserver

cd /usr/local/src/vpnserver

cp src/makefiles/linux_64bit.mak Makefile
make

cp bin/vpnserver/vpnserver /opt/vpnserver
cp bin/vpnserver/hamcore.se2 /opt/hamcore.se2
cp bin/vpncmd/vpncmd /opt/vpncmd

rm -rf /usr/local/src/vpnserver

yum -y remove readline-devel ncurses-devel openssl-devel \
  && yum -y groupremove "Development Tools" \
  && yum clean all

exit 0
