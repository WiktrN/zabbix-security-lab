---

## 🛡️ Full-Stack Monitoring & Security Lab

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

```bash
# Sklonuj projekt
git clone https://github.com/WiktrN/zabbix-security-lab.git
cd zabbix-security-lab

# Uruchom laboratorium
docker compose up -d --build
```

**Uwaga:** Pierwsze uruchomienie trwa ok. 2-3 minuty (inicjalizacja baz danych i import backupów).

---

## 🛠️ Panel Sterowania (Dashboardy)
| Usługa | URL | Użytkownik | Hasło |
| :--- | :--- | :--- | :--- |
| **🔍 Zabbix** | [http://localhost:8080](http://localhost:8080) | `Admin` | `zabbix` |
| **📊 Grafana** | [http://localhost:3000](http://localhost:3000) | `admin` | `admin` |
| **🛡️ Wazuh** | [https://localhost:8443](https://localhost:8443) | `admin` | `admin` |
| **📈 Prometheus** | [http://localhost:9090](http://localhost:9090) | `-` | `-` |
| **📝 WordPress** | [http://localhost:8081](http://localhost:8081) | `WiktorN` | `MbMvQpZJJBEuU2#wyZ` |
| **🧪 Joomla** | [http://localhost:8082](http://localhost:8082) | `WiktorN` | `MbMvQpZJJBEuU2#wyZ` |

---

## ⚔️ Kali Linux - Centrum Ataku
Kontener Kali jest gotowy do pracy zaraz po starcie.

```Bash
docker exec -it kali-attacker bash
```
**Wbudowane narzędzia:** nmap, hydra, hping3, sqlmap, curl, zabbix-agent.

---

## 📂 Struktura Projektu
```Plaintext
.
├── config/             # Konfiguracje (Prometheus, Suricata)
├── data/               # Dane trwałe (Bazy danych, backupy Grafany)
│   └── init-db/        # Skrypty inicjalizujące SQL (WP, Joomla, Zabbix)
├── kali/               # Dockerfile i dane domowe atakującego
└── docker-compose.yml  # Definicja całego stosu
```

---

## 🕵️ Weryfikacja Systemu i Scenariusze Testowe

Ten projekt został wstępnie skonfigurowany do dynamicznej analizy zdarzeń bezpieczeństwa. Użyj poniższych scenariuszy, aby sprawdzić działanie stosu SOC:

**1. Detekcja Ataków (Suricata IDS + Zabbix)**

* **Działanie:** Uruchom symulowany atak z kontenera Kali: 

```bash
docker exec -it kali-attacker curl http://wordpress.
```

* **Alert Zabbix:** Na dashboardzie pojawi się powiadomienie **Suricata Alert: GPC Potential SSH Brute Force.**

* **Automatyzacja:** Dzięki konfiguracji Recovery expression (nodata), alert zostanie automatycznie zamknięty 30 sekund po ustaniu ruchu, utrzymując porządek w konsoli SOC.

**2. Monitorowanie Infrastruktury (Docker Health)**

* **Symulacja:** Zatrzymaj kontener ręcznie, aby wywołać alert: docker stop zabbix-joomla-1.

* **Dynamiczne Alerty:** Host zabbix-agent2 zgłosi następujące zdarzenia (zgodnie z nową konfiguracją angielską):

 - **Czerwony Alert (High):** Critical: zabbix-joomla-1 service is unhealthy (Healthcheck failure) – jeśli skrypt sprawdzający stan zdrowia bazy zgłosi błąd.

 - **Pomarańczowy Alert (Average):** Warning: zabbix-joomla-1 application container has been stopped – gdy proces kontenera zostanie zakończony.

* **Web Monitoring:** W sekcji Monitoring -> Hosts -> Web możesz sprawdzić w czasie rzeczywistym status HTTP i czas odpowiedzi dla WordPressa oraz Joomli.

**3. Operacje SIEM (Wazuh Manager)**

* **Sprawdzenie Statusu:** Zweryfikuj działanie silnika SIEM, wyświetlając listę aktywnych agentów:

```bash
docker exec -it wazuh-manager /var/ossec/bin/agent_control -l
```

* **Uwaga: Przez pierwsze 2-3** minuty od uruchomienia mogą pojawiać się błędy Connection refused dla queue/db/wdb. Jest to normalne zjawisko – usługi Wazuha potrzebują czasu na zainicjowanie wewnętrznych gniazd bazy danych.

---

## ⚠️ Rozwiązywanie problemów
* **Zasoby:** Upewnij się, że Docker ma przydzielone minimum **6GB RAM** (Wazuh Indexer jest dość wymagający).

* **Uprawnienia:** Jeśli bazy danych nie wstają, sprawdź uprawnienia do folderu data/.

* **Sieć:** Suricata domyślnie nasłuchuje na eth0. Jeśli Twój główny interfejs w Dockerze nazywa się inaczej, skoryguj to w docker-compose.yml w sekcji command dla Suricaty.

---
