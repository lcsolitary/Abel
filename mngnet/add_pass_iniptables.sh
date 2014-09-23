#!/bin/bash
# Author: liucheng.lc

[ `id -u` -ne 0 ] && { echo 'The scripts need root privilege !!!'; exit; }

RULES=/etc/firewall

[ -e $RULES ] || { echo 'There is no firewall rules!'; exit;}

iptables-restore < $RULES

refresh_rules_pid=`ps -eo uid,pid,cmd | awk '$4=="refresh_rules" {print $2}'`

[ -z $refresh_rules_pid ] || { echo 'refresh_rules is running ...'; exit; }

cat > refresh_rules << EOF
while :; do
    who | grep 'ppp' | awk -F '[()]' '{print \$2}' | while read line
    do
        iptables -C INPUT -p tcp -s \$line -m multiport --dport 80,9999 -j ACCEPT || \
        iptables -A INPUT -p tcp -s \$line -m multiport --dport 80,9999 -j ACCEPT
    done
    sleep 10s
done
EOF

bash refresh_rules > /dev/null 2>&1 &
sleep 2s
rm -f refresh_rules

