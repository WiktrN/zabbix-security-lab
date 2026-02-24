# Full-Stack Monitoring & Security Lab

Kompleksowe środowisko laboratoryjne oparte na Dockerze, łączące systemy monitorowania, analizy bezpieczeństwa (SIEM/IDS) oraz popularne systemy zarządzania treścią (CMS). Projekt został stworzony w celu demonstracji umiejętności z zakresu DevOps, administracji Linux oraz Cyberbezpieczeństwa.

## 🚀 Architektura Systemu

### 1. Monitoring & Wizualizacja
* **Zabbix**: Główny system monitorowania infrastruktury i kontenerów.
* **Prometheus**: Zbieranie metryk wydajnościowych w czasie rzeczywistym.
* **Grafana**: Zaawansowane dashboardy integrujące dane z Zabbixa i Prometheusa.

### 2. Cyberbezpieczeństwo (SOC in a box)
* **Wazuh (SIEM/EDR)**: Monitorowanie logów, wykrywanie podatności i incydentów.
* **Suricata (IDS/IPS)**: System wykrywania intruzów analizujący ruch sieciowy.
* **Kali Linux**: Kontener pełniący rolę "attackera" do testów penetracyjnych i weryfikacji alertów.

### 3. Infrastruktura Aplikacyjna
* **WordPress & Joomla**: Dwie niezależne platformy CMS z własnymi bazami danych (MariaDB), służące jako obiekty monitorowania i potencjalne cele testowe.
