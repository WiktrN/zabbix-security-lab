apt update && apt install nmap metasploit-framework
apt update && apt upgrade -y
apt install -y kali-linux-headless
apt install -y kali-linux-top10
apt update
apt install -y kali-linux-top10
exit
apt update && apt install zabbix-agent -y
sed -i 's/Server=127.0.0.1/Server=zabbix-server/' /etc/zabbix/zabbix_agentd.conf
sed -i 's/Hostname=Zabbix server/Hostname=kali-attacker/' /etc/zabbix/zabbix_agentd.conf
service zabbix-agent start
exit
sed -i 's/^Server=.*/Server=0.0.0.0\/0,zabbix-server/' /etc/zabbix/zabbix_agentd.conf
sed -i 's/^ServerActive=.*/ServerActive=zabbix-server/' /etc/zabbix/zabbix_agentd.conf
sed -i 's/^Hostname=.*/Hostname=kali-attacker/' /etc/zabbix/zabbix_agentd.conf
service zabbix-agent restart
docker exec -it kali-attacker tail -n 20 /var/log/zabbix/zabbix_agentd.log
exit
docker exec -it kali-attacker curl http://wordpress -A "Nikto"
exit
docker exec -it kali-attacker curl http://wordpress -A "Nikto"
exit
