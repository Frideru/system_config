#!/bin/bash

# ===
# Настройка брандмауэра
# ===

# Для работы с кафкой по сети необходимо открыть порт 9092.
sudo iptables -I INPUT -p tcp --dport 9092 -j ACCEPT

# Сохранение правил через iptables-persistent
sudo apt install iptables-persistent
netfilter-persistent save

# ===
# Установка OpenJDK
# ===

sudo apt install default-jdk

java -version

# ===
# Установка и настройка Kafka
# ===

KAFKAURL=$(curl https://kafka.apache.org/downloads | awk -F\" '/Binary/  {print $2}' | head -n 1)
KAFKARCHIVE=$(echo $KAFKAURL | awk -F/ '{print $6}')

wget $KAFKAURL

sudo mkdir /opt/kafka
tar zxf kafka_*.tgz -C /opt/kafka --strip 1

# Директива разрешает ручное удаление темы из кафки.
echo "delete.topic.enable = true" >> /opt/kafka/config/server.properties

# ===
# Настройка запуска kafka
# ===

sudo useradd -r -c 'Kafka broker user service' kafka
sudo chown -R kafka:kafka /opt/kafka

# Юнит для zookeeper
sudo cat << EOL > "/etc/systemd/system/zookeeper.service"
[Unit]  
Description=Zookeeper Service  
Requires=network.target remote-fs.target  
After=network.target remote-fs.target  
  
[Service]  
Type=simple  
User=kafka  
ExecStart=/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties  
ExecStop=/opt/kafka/bin/zookeeper-server-stop.sh  
ExecReload=/bin/kill -HUP $MAINPID  
Restart=on-failure  
  
[Install]  
WantedBy=multi-user.target
EOL

# Юнит для kafka
sudo cat << EOL > "/etc/systemd/system/kafka.service"
[Unit]  
Description=Kafka Service  
Requires=zookeeper.service  
After=zookeeper.service  
  
[Service]  
Type=simple  
User=kafka  
ExecStart=/bin/sh -c '/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties > /opt/kafka/kafka.log 2>&1'  
ExecStop=/opt/kafka/bin/kafka-server-stop.sh  
ExecReload=/bin/kill -HUP $MAINPID  
Restart=on-failure  
  
[Install]  
WantedBy=multi-user.target
EOL

sudo systemctl daemon-reload
sudo systemctl enable zookeeper kafka
sudo systemctl start kafka

sudo ss -tunlp | grep :9092

# ===
# Тестовый обмен сообщениями
# ===

cat << 'EOF' > "kafka_test_messages.md"
## Тестовый обмен сообщениями

Попробуем немного научиться работать с кафкой и проверить, что сервис работает. Мы создадим тему для сообщений и отправим текст **Hello, World from Kafka**.

Нам понадобиться три скрипта, которые идут в комплекте с кафкой:

- **kafka-topics.sh —** создает тему, куда будем отправлять сообщение.
- **kafka-console-producer.sh —** создает обращение издателя, который отправляет сообщение.
- **kafka-console-consumer.sh —** формирует запрос к брокеру и получает сообщение.

И так, первой командой мы создаем тему:
```bash
/opt/kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic Test
```

где:
- **/opt/kafka —** путь, куда была установлена нами кафка.
- **bootstrap-server localhost:9092 —** адрес хоста kafka. Предполагается, что мы запускаем нашу команду на том же сервере, где ее и развернули.
- **replication-factor —** количество реплик журнала сообщений.
- **partitions —** количество разделов в теме.
- **topic Test —** в нашем примере мы создадим тему с названием Test.

Теперь отправляем сообщение брокеру:
```bash
echo "Hello, World from Kafka" | /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic Test
```

> в данном примере мы отправляем в наш сервер сообщение **Hello, World from Kafka**.

Попробуем достать сообщение. Выполняем команду:

```bash
/opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic Test --from-beginning
```

> опция **from-beginning** позволяет увидеть все сообщения, которые были отправлены в брокер до создания подписчика (отправки запроса на чтения данных из кафки).

Мы должны увидеть:
```text
Hello, World from Kafka
```

При этом мы подключимся к серверу в интерактивном режиме. Не спешим выходить. Откроем вторую сессию SSH и еще раз введем:
```bash
echo "Hello, World from Kafka again" | /opt/kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic Test
```

Вернемся к предыдущей сессии SSH и мы должны увидеть:
```text
Hello, World from Kafka  
Hello, World from Kafka again
```

Можно считать, что программа минимум выполнена — Kafka установлена и работает.
EOF

echo "Kafka установлен!"
echo "Я создал файл .md в котором описан процесс проверки установки через отправку тестовых сообщений."
echo "Можешь им воспользоваться или удалить если он тебе не нужен."
printf "Ссылка на источник: \033[33m%s\033[0m" "https://www.dmosk.ru/miniinstruktions.php?mini=kafka-linux"
