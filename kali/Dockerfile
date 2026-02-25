FROM kalilinux/kali-rolling:latest

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    zabbix-agent \
    nmap \
    hydra \
    hping3 \
    curl \
    sqlmap \
    && apt-get clean

CMD ["/bin/bash"]
