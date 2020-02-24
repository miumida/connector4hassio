#!/bin/bash

CONFIG_PATH=/data/options.json

echo "[Info] Welcom to connector4hassio/lgconnector!"

DATA_PATH=$(jq --raw-output ".data_path" $CONFIG_PATH)

echo "[Info] lgconnector4hassio addons Start Ready"

# Check if config exists already
mkdir -p $DATA_PATH
mkdir -p /config/lgconnector

#if [[ ! -f /config/lgconnector/lg-config.json ]]; then
#    cp lg-config.json /config/lgconnector/lg-config.json
#fi

# Change config.js
echo "[Info] connector4hassio/lgconnector addons lg-config.js editing"

# util/config.js Edit for hassio
sed '10s|config/lg-config.json|config/lgconnector/lg-config.json|' util/config_bak.js > util/config.js
sed '23s|config/lg-config.json|config/lgconnector/lg-config.json|' util/config.js > util/config.js

# util/log.js Edit for hassio
sed '29s|config/lg-connector.log|config/lgconnector/lg-connector.log|' util/log.js > util/log.js

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

echo "[Info] Start lgconnector:D"

# start lgconnector
npm start
