# 8.2 описание Playbook

## GROUP VARS
clickhouse_packages - имена пакетов установки ClickHouse
clickhouse_version - используемая версия ClickHouse

vector_url - переменная ссылки для установки пакета Vector
vector_version - переменная версии пакета Vector
vector_config - переменная конфигурационного файла для Vector
 
## Play  Install Clickhouse

### Get clickhouse distrib
 - установка переменных (facts)
 - загрузка установочных пакетов clickhouse

### Install clickhouse packages
 - Установка пакетов: clickhouse-common-static, clickhouse-client, clickhouse-server

### Start clickhouse service
 - запуск clickhouse service

 ### Create database
 - создание базы данных "Logs"

 ## Play Install Vector

 ### Vector | Install RPM
 - установка Vector из RPM

 ### Vector | Template config
 - создание конфигурационного файла для Vector  по шаблону из vector.yml.j2

 ### Vector | create systemd unit
  - создание службы для запуска Vector по шаблону из vector.service.j2

### Vector | Start service
 - запуск Vector
