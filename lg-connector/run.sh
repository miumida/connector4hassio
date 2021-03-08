# Check if config exists already
mkdir -p /config/lg-connector
mkdir -p /share/lg-connector

# Check lg-config.json file Not exists
if [[ ! -f /config/lg-connector/lg-config.json ]]; then
    cp lg-config.json /config/lg-connector/lg-config.json
fi

# util/config.js
echo "[Info] LG-Connector addons config.js editing"
sed -i '10,23s|config/lg-config.json|config/lg-connector/lg-config.json|' util/config.js

# Edit util/log.js
echo "[Info] LG-Connector addons log.js editing"
sed -i '29s|config/lg-connector.log|config/lg-connector/lg-connector.log|' util/log.js

npm start
