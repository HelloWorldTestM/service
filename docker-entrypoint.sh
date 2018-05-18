#!/bin/bash
if [ "$2" == "agent" ]; then
    if [[ "$1" == "consumer" ]]; then
      echo "Starting consumer service..."
       nohup java -jar \
            -Xms512M \
            -Xmx512M \
            -Dlogs.dir=/root/logs \
            /root/dists/mesh-consumer.jar \
            > /dev/null 2>&1 &
    elif [[ "$1" == "provider-small" ]]; then
      echo "Starting small provider service..."
       nohup java -jar \
            -Xms256M \
            -Xmx256M \
            -Ddubbo.protocol.port=20889 \
            -Ddubbo.application.qos.enable=false \
            -Dlogs.dir=/root/logs \
            /root/dists/mesh-provider.jar \
            > /dev/null 2>&1 &
    elif [[ "$1" == "provider-medium" ]]; then
      echo "Starting medium provider service..."
       nohup java -jar \
            -Xms512M \
            -Xmx512M \
            -Ddubbo.protocol.port=20890 \
            -Ddubbo.application.qos.enable=false \
            -Dlogs.dir=/root/logs \
            /root/dists/mesh-provider.jar \
            > /dev/null 2>&1 &
    elif [[ "$1" == "provider-large" ]]; then
      echo "Starting large provider service..."
        nohup java -jar \
            -Xms750M \
            -Xmx750M \
            -Ddubbo.protocol.port=20891 \
            -Ddubbo.application.qos.enable=false \
            -Dlogs.dir=/root/logs \
            /root/dists/mesh-provider.jar \
            > /dev/null 2>&1 &
    else
      echo "Unrecognized arguments, exit."
      exit 1
    fi
else
    if [[ "$1" == "consumer" ]]; then
      echo "Starting consumer service..."
       java -jar \
            -Xms512M \
            -Xmx512M \
            -Dlogs.dir=/root/logs \
            /root/dists/mesh-consumer.jar \
            > /dev/null 2>&1
    elif [[ "$1" == "provider-small" ]]; then
      echo "Starting small provider service..."
       java -jar \
            -Xms256M \
            -Xmx256M \
            -Ddubbo.protocol.port=20889 \
            -Ddubbo.application.qos.enable=false \
            -Dlogs.dir=/root/logs \
            /root/dists/mesh-provider.jar \
            > /dev/null 2>&1
    elif [[ "$1" == "provider-medium" ]]; then
      echo "Starting medium provider service..."
       java -jar \
            -Xms512M \
            -Xmx512M \
            -Ddubbo.protocol.port=20890 \
            -Ddubbo.application.qos.enable=false \
            -Dlogs.dir=/root/logs \
            /root/dists/mesh-provider.jar \
            > /dev/null 2>&1
    elif [[ "$1" == "provider-large" ]]; then
      echo "Starting large provider service..."
       java -jar \
            -Xms750M \
            -Xmx750M \
            -Ddubbo.protocol.port=20891 \
            -Ddubbo.application.qos.enable=false \
            -Dlogs.dir=/root/logs \
            /root/dists/mesh-provider.jar \
            > /dev/null 2>&1
    else
      echo "Unrecognized arguments, exit."
      exit 1
    fi
fi

if [ -x "$(command -v start-agent.sh)" ] && [ "$2" == "agent" ]; then
  start-agent.sh "$@"
fi
