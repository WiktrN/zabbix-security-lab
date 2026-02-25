# 🛡️ Full-Stack Monitoring & Security Lab

### Kompletne poligon doświadczalny: Monitoring, SIEM, IDS & Penetration Testing

To środowisko łączy światy **DevOps** i **Cybersecurity**, oferując w pełni skonfigurowany stos monitorujący oraz zaawansowane narzędzia bezpieczeństwa skierowane przeciwko podatnym aplikacjom webowym.

---

## 🏗️ Architektura Systemu

* **Monitoring:** Zabbix (Server, Web, Agents), Prometheus, Grafana
* **Security (SIEM/IDS):** Wazuh (Indexer, Manager, Dashboard), Suricata
* **Targets (Vulnerable Apps):** WordPress & Joomla na bazach MariaDB
* **Offensive:** Kali Linux (Attacker) ze zintegrowanym Zabbix Agentem

---

## 🚀 Szybki Start

### 1. Sklonuj projekt
```bash
git clone https://github.com/WiktrN/zabbix-security-lab.git
cd zabbix-security-lab

Uruchom laboratorium
docker compose up -d --build
Uwaga: Pierwsze uruchomienie trwa ok. 2-3 minuty (inicjalizacja baz danych i import backupów).

# 🛠️ Panel Sterowania (Dashboardy)
Usługa    URL    Użytkownik    Hasło
🔍 Zabbix    localhost:8080    Admin    zabbix
📊 Grafana    localhost:3000    admin    admin
🛡️ Wazuh    localhost:8443    admin    admin
📈 Prometheus    localhost:9090    -    -
📝 WordPress    localhost:8081    WiktorN    MbMvQpZJJBEuU2#wyZ
🧪 Joomla    localhost:8082    WiktorN    MbMvQpZJJBEuU2#wyZ

# ⚔️ Kali Linux - Centrum Ataku
Kontener Kali jest gotowy do pracy zaraz po starcie.

Bash
docker exec -it kali-attacker bash
Wbudowane narzędzia: nmap, hydra, hping3, sqlmap, curl, zabbix-agent.

# 📂 Struktura Projektu
Plaintext
.
├── config/             # Konfiguracje (Prometheus, Suricata)
├── data/               # Dane trwałe (Bazy danych, backupy Grafany)
│   └── init-db/        # Skrypty inicjalizujące SQL (WP, Joomla, Zabbix)
├── kali/               # Dockerfile i dane domowe atakującego
└── docker-compose.yml  # Definicja całego stosu

# 🕵️ Przykładowe Scenariusze Testowe
Reakcja IDS: Wykonaj nmap -sV [IP-celu] z Kali i sprawdź logi Suricaty w config/suricata/log/eve.json.

Monitoring SIEM: Zaloguj się do Wazuh i zaobserwuj zdarzenia systemowe z agentów.

Alerting Zabbix: Wyłącz jeden z kontenerów i zobacz, jak szybko Zabbix wyśle powiadomienie o braku dostępności usługi.

# ⚠️ Rozwiązywanie problemów
Zasoby: Upewnij się, że Docker ma przydzielone minimum 6GB RAM (Wazuh Indexer jest dość wymagający).

Uprawnienia: Jeśli bazy danych nie wstają, sprawdź uprawnienia do folderu data/.

Sieć: Suricata domyślnie nasłuchuje na eth0. Jeśli Twój główny interfejs w Dockerze nazywa się inaczej, skoryguj to w docker-compose.yml w sekcji command dla Suricaty.
