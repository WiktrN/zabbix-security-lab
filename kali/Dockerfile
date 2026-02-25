FROM kalilinux/kali-rolling:latest

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    zabbix-agent \
    nmap \
    hydra \
    hping3 \
    curl \
    sqlmap \
    && apt-get clean

RUN sed -i 's/Server=127.0.0.1/Server=zabbix-server/' /etc/zabbix/zabbix_agentd.conf && \
    sed -i 's/Hostname=Zabbix server/Hostname=kali-attacker/' /etc/zabbix/zabbix_agentd.conf

CMD service zabbix-agent start && /bin/bash