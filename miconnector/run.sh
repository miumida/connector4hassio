#!/bin/bash

CONFIG_PATH=/data/options.json

echo "[Info] Welcom to miconnector4hassio!"

DATA_PATH=$(jq --raw-output ".data_path" $CONFIG_PATH)

echo "[Info] miconnector4hassio addons Start Ready"

# Check if config exists already
mkdir -p $DATA_PATH

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

echo "[Info] Start miconnector:D"
# start miconnector
npm start
