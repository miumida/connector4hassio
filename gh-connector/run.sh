#!/bin/bash

#CONFIG_PATH=/data/options.json

echo "[Info] Welcom to GH-Connector addon!"

#DATA_PATH=$(jq --raw-output ".data_path" $CONFIG_PATH)

# Check if config exists already
mkdir -p /config/gh-connector

# music1 volume directory create
mkdir -p /share/gh-connector
#mkdir -p /share/gh-connector/music

# Check gh-config.json file Not exists
#if [[ ! -f /config/ghconnector/gh-config.json ]]; then
#    cp gh-config.json /config/ghconnector/gh-config.json
#fi

# Change util/config.js
#echo "[Info] ghconnector4hassio addons config.js editing"
#sed '10,22s|config/gh-config.json|config/ghconnector/gh-config.json|' util/config_bak.js > util/config.js

# Edit util/log.js
echo "[Info] GH-Connector addons log.js editing"
sed '30s|config/gh-connector.log|config/gh-connector/gh-connector.log|' util/log.js > util/log.js

# Change sevice/mp3.js
#echo "[Info] ghconnector4hassio addons log.js editing"
#sed '17s|/music1|/share/ghconnector/music|' service/mp3_bak.js > service/mp3.js

# Check
#if [[ -f $DATA_PATH/configuration.yaml ]]; then
#    if [[ ! -f $DATA_PATH/.configuration.yaml.bk ]]; then
#        echo "[Info] Configuration file found in data path, but no backup file found in data path. Backing up existing configuration to ${DATA_PATH}/.configuration.yaml.bk"
#        cp $DATA_PATH/configuration.yaml $DATA_PATH/.configuration.yaml.bk
#    else
#        echo "[Info] Configuration backup found in ${DATA_PATH}/.configuration.yaml.bk. Skipping config backup."
#    fi
#fi

# Parse config
#cat "$CONFIG_PATH" | jq 'del(.data_path)' > $DATA_PATH/configuration.yaml

echo "[Info] Start GH-Connector:D"

# start ghconnector
npm start
