#!/bin/sh

echo "[INFO] CentOS8 Stream Settings Start."

dnf -y update

systemctl stop firewalld
systemctl disable firewalld

if [ -e /etc/sysconfig/network-scripts/ifcfg-enp0s3 ]; then
  sed -i -e "s/ONBOOT=no/ONBOOT=yes/g" /etc/sysconfig/network-scripts/ifcfg-enp0s3
else
  echo "[ERROR] /etc/sysconfig/network-scripts/ifcfg-enp0s3 does not exist."
fi

if [ -e /etc/sysconfig/network-scripts/ifcfg-enp0s8 ]; then
  sed -i -e "s/ONBOOT=no/ONBOOT=yes/g" /etc/sysconfig/network-scripts/ifcfg-enp0s8
  sed -i -e "s/BOOTPROTO=dhcp/BOOTPROTO=static/g" /etc/sysconfig/network-scripts/ifcfg-enp0s8
  echo "IPADDR=192.168.56.11" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8
  ifup enp0s8
else
  echo "[ERROR] /etc/sysconfig/network-scripts/ifcfg-enp0s8 does not exist."
fi

setenforce 0
if [ -e /etc/selinux/config ]; then
  sed -i -e "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
else
  echo "[ERROR] /etc/selinux/config does not exist."
fi

echo "[INFO] CentOS8 Stream Settings End."

