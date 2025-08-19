FROM ubuntu:latest

# Установим зависимости
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git && \
    rm -rf /var/lib/apt/lists/*

# Установим зависимости Python
RUN pip3 install --no-cache-dir PyYAML

# Копируем скрипты
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]