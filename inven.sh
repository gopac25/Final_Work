#! /bin/bash

log=moviehub_inventory
>$log
echo "#Ansible Inventory" >>$log
echo "Version 1.0" >>$log
echo "Author: Gopala Krishnan Chellappa <gopac25@gmail.com> >>$log

echo "###############################################################################" >>$log
echo "# Groups" >>$log
echo "###############################################################################" >>$log

echo "[all-servers:children]" >>$log
echo "jump" >>$log
echo "dbmaster" >>$log
echo "dbslave" >>$log
echo "web-servers" >>$log
echo "app-servers" >>$log

echo "[jump]" >>$log
echo "`aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[].Instances[].[PrivateIpAddress,Tags[?Key==`Name`].Value[]]'| sed 's/None$/None\n/' | sed '$!N;s/\n/ /'|grep -i jump`" >>$log

echo "[dbmaster]" >>$log
echo "`aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[].Instances[].[PrivateIpAddress,Tags[?Key==`Name`].Value[]]'| sed 's/None$/None\n/' | sed '$!N;s/\n/ /'|grep -i master`" >>$log

echo "[dbslave]" >>$log
echo "`aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[].Instances[].[PrivateIpAddress,Tags[?Key==`Name`].Value[]]'| sed 's/None$/None\n/' | sed '$!N;s/\n/ /'|grep -i slave`" >>$log

echo "[web-servers]" >>$log
echo "`aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[].Instances[].[PrivateIpAddress,Tags[?Key==`Name`].Value[]]'| sed 's/None$/None\n/' | sed '$!N;s/\n/ /'|grep -i web`" >>$log

echo "[app-servers]" >>$log
echo "`aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query 'Reservations[].Instances[].[PrivateIpAddress,Tags[?Key==`Name`].Value[]]'| sed 's/None$/None\n/' | sed '$!N;s/\n/ /'|grep -i app`" >>$log