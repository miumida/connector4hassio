#!/bin/bash

CONFIG_PATH=/data/options.json

echo Mi-Connector!

DATA_PATH=$(jq --raw-output ".data_path" $CONFIG_PATH)

echo "Mi-Connector start"

# Check if config exists already
mkdir -p $DATA_PATH

#mkdir -p /opt/miconnector

echo "create folder /opt/miconnector"

chmod a+x /usr/local/bin/dockerpull

dockerpull /opt/miconnector fison67/mi-connector-arm:latest


#if [[ -f $DATA_PATH/configuration.yaml ]]; then
#    if [[ ! -f $DATA_PATH/.configuration.yaml.bk ]]; then
#        echo "[Info] Configuration file found in data path, but no backup file found in data path. Backing up existing configuration to ${DATA_PATH}/.configuration.yaml.bk"
#        cp $DATA_PATH/configuration.yaml $DATA_PATH/.configuration.yaml.bk
#    else
#        echo "[Info] Configuration backup found in ${DATA_PATH}/.configuration.yaml.bk. Skipping config backup."
#    fi
#fi

# Parse config
cat "$CONFIG_PATH" | jq 'del(.data_path)' > $DATA_PATH/configuration.yaml

# RUN lgtv2mqtt
#node /usr/lib/node_modules/lgtv2mqtt/index.js --verbosity=info --name=lgtv --url=$MQTT_SERVER --tv=$LGWEBOSTV
