#!/bin/bash

CONFIG_PATH=/data/options.json

echo "[Info] Welcom to hassio-Mi-Connector!"

DATA_PATH=$(jq --raw-output ".data_path" $CONFIG_PATH)

echo "[Info] hassio-Mi-Connector Ready"

# Check if config exists already
mkdir -p $DATA_PATH

chmod a+x /usr/local/bin/dockerpull

echo "[Info] download start [ fison67/mi-connector-arm:latest ]"
dockerpull /home/miconnector fison67/mi-connector-arm:latest

echo "[Info] dockerpull Complate! => /home/miconnector"

echo "[Info] Working Directory => /home/micconnector/usr/src/app"
cd /home/micconnector/usr/src/app

if [[ -f $DATA_PATH/configuration.yaml ]]; then
    if [[ ! -f $DATA_PATH/.configuration.yaml.bk ]]; then
        echo "[Info] Configuration file found in data path, but no backup file found in data path. Backing up existing configuration to ${DATA_PATH}/.configuration.yaml.bk"
        cp $DATA_PATH/configuration.yaml $DATA_PATH/.configuration.yaml.bk
    else
        echo "[Info] Configuration backup found in ${DATA_PATH}/.configuration.yaml.bk. Skipping config backup."
    fi
fi

# Parse config
cat "$CONFIG_PATH" | jq 'del(.data_path)' > $DATA_PATH/configuration.yaml

# start miconnector
npm start
