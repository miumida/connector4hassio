# Check if config exists already
mkdir -p /config/gh-connector
mkdir -p /share/gh-connector
mkdir -p /share/gh-connector/music

# Check gh-config.json file Not exists
#if [[ ! -f /config/gh-connector/gh-config.json ]]; then
#    cp gh-config.json /config/gh-connector/gh-config.json
#fi

# Change util/config.js
#echo "[Info] ghconnector4hassio addons config.js editing"
#sed '10,22s|config/gh-config.json|config/ghconnector/gh-config.json|' util/config_bak.js > util/config.js

# Edit util/log.js
echo "[Info] GH-Connector addons log.js editing"
sed -i '30s|config/gh-connector.log|config/gh-connector/gh-connector.log|' util/log.js

# Change sevice/mp3.js
echo "[Info] GH-Connector addons mp3.js editing"
sed -i '17s|/music1|/share/gh-connector/music|' service/mp3.js

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
