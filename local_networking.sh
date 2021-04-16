#!/bin/bash

ln_default_ip=`ip route get 114.114.114.114 | awk '{print $7}'`
ln_default_dev=`ip route get 114.114.114.114 | awk '{print $5}'`
ln_default_gwip=`ip route get 114.114.114.114 | awk '{print $3}'`
ln_default_mac=`nmcli dev show $ln_default_dev | grep HWADDR | awk '{print $2}'`
ln_default_dns=`nmcli dev show $ln_default_dev | grep IP4.DNS | awk '{print $2}' | xargs | tr " " ","`

echo "[local] NIC:            $ln_default_dev"
echo "[local] MAC:            $ln_default_mac"
echo "[local] IP:             $ln_default_ip"
echo "[local] Gateway IP:     $ln_default_gwip"
echo "[local] DNS IP:         $ln_default_dns"
