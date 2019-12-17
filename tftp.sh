#!/usr/bin/env bash

yum install -y dnsmasq
cat > dnsmasq.conf << EOF
enable-tftp
tftp-root=/opt/ftpd/
EOF
mv dnsmasq.conf /etc/dnsmasq.conf

mkdir /opt/ftpd

cat > /opt/ftpd/test << EOF
This is a test file of tftp.
EOF

systemctl disable --now firewalld
systemctl enable --now dnsmasq
