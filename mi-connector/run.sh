# Check if config exists already
mkdir -p /config/mi-connector
mkdir -p /share/mi-connector

# Check config.json file Not exists
if [[ ! -f /config/mi-connector/config.json ]]; then
    cp config.json /config/mi-connector/config.json
fi

# Change util/config.js
#echo "[Info] Mi-Connector addons log.js editing"
#sed -i '10,22s|config/gh-config.json|config/gh-connector/gh-config.json|' util/config.js

# Edit util/log.js
echo "[Info] Mi-Connector addons log.js editing"
sed -i '42s|config/connector.log|config/mi-connector/connector.log|' util/log.js

# Check
#if [[ -f $DATA_PATH/configuration.yaml ]]; then
#    if [[ ! -f $DATA_PATH/.configuration.yaml.bk ]]; then
#        echo "[Info] Configuration file found in data path, but no backup file found in data path. Backing up existing configuration to ${DATA_PATH}/.configuration.yaml.bk"
#        cp $DATA_PATH/configuration.yaml $DATA_PATH/.configuration.yaml.bk
#    else
#        echo "[Info] Configuration backup found in ${DATA_PATH}/.configuration.yaml.bk. Skipping config backup."
#    fi
#fi

# start ghconnector
npm start
