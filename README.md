# Full-Stack Monitoring & Security Lab

Kompletne środowisko do nauki cyberbezpieczeństwa z monitoringiem (Zabbix, Prometheus, Grafana), SIEM (Wazuh), IDS (Suricata) oraz celami ataków (WordPress, Joomla) + Kali Linux.

## Wymagania

- Docker + Docker Compose
- 4GB RAM minimum
- Wolne porty: 3306, 8080-8082, 3000, 9090, 8443, 10051, 1514-1515, 55000

## Szybki start

```bash
git clone https://github.com/WiktrN/zabbix-security-lab.git
cd zabbix-security-lab
docker-compose up -d

Pierwsze uruchomienie trwa 2-3 minuty (inicjalizacja baz danych).

Dostępne usługi

Wszystkie usługi są w pełni skonfigurowane – wystarczy wejść na adres i zalogować się.

| Usługa         | URL                      | Login        | Hasło              |
| -------------- | ------------------------ | ------------ | ------------------ |
| Zabbix         | <http://localhost:8080>  | Admin        | zabbix             |
| WordPress      | <http://localhost:8081>  | WiktorN      | MbMvQpZJJBEuU2#wyZ |
| Joomla (admin) | <http://localhost:8082>  | WiktorN      | MbMvQpZJJBEuU2#wyZ |
| Joomla (user)  | <http://localhost:8082>  | joomla\_user | joomla\_password   |
| Grafana        | <http://localhost:3000>  | admin        | admin              |
| Prometheus     | <http://localhost:9090>  | -            | -                  |
| Wazuh          | <https://localhost:8443> | admin        | admin              |

Kali Linux (attacker)

docker exec -it kali-attacker bash

Dostępne narzędzia: nmap, hydra, hping3, sqlmap, curl, zabbix-agent

Zarządzanie

# Zatrzymaj wszystko
docker-compose down

# Zatrzymaj i usuń wszystkie dane (czysty reset)
docker-compose down -v

# Sprawdź logi
docker-compose logs -f [nazwa_usługi]

Architektura

- Monitoring: Zabbix (serwer + web + agenci), Prometheus, Grafana
- Bezpieczeństwo: Wazuh (SIEM), Suricata (IDS)
- Cele: WordPress, Joomla (MariaDB)
- Attacker: Kali Linux

Uwagi

Hasła są ustawione na sztywno w plikach konfiguracyjnych – zmień je w środowisku produkcyjnym
Suricata wymaga interfejsu eth0 – jeśli masz inny, zmień w docker-compose.yml
