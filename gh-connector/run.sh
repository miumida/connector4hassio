CONFIG_PATH=/data/options.json

MUSIC1=$(jq --raw-output ".music1_path" $CONFIG_PATH)
MUSIC2=$(jq --raw-output ".music2_path" $CONFIG_PATH)
MUSIC3=$(jq --raw-output ".music3_path" $CONFIG_PATH)

echo "[Info] music1 mount path is ${MUSIC1}"
echo "[Info] music2 mount path is ${MUSIC2}"
echo "[Info] music3 mount path is ${MUSIC3}"

# Check if config exists already
mkdir -p /config/gh-connector
mkdir -p /share/gh-connector
mkdir -p /share/gh-connector/music
mkdir -p $MUSIC2
mkdir -p $MUSIC3

# Check gh-config.json file Not exists
if [[ ! -f /config/gh-connector/gh-config.json ]]; then
    cp gh-config.json /config/gh-connector/gh-config.json
fi

# Change util/config.js
echo "[Info] GH-Connector addons config.js editing"
sed -i '10,22s|config/gh-config.json|config/gh-connector/gh-config.json|' util/config.js

# Edit util/log.js
echo "[Info] GH-Connector addons log.js editing"
sed -i '30s|config/gh-connector.log|config/gh-connector/gh-connector.log|' util/log.js

# Change sevice/mp3.js
echo "[Info] GH-Connector addons mp3.js editing"
sed -i '17s|/music1|/share/gh-connector/music|' service/mp3.js
sed -i '18s|/music2|${MUSIC2}|' service/mp3.js
sed -i '19s|/music3|${MUSIC3}|' service/mp3.js

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
