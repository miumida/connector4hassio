# Check if config exists already
mkdir -p /config/lg-connector
mkdir -p /share/lg-connector

# Edit util/log.js
echo "[Info] GH-Connector addons log.js editing"
sed -i '29s|config/lg-connector.log|config/lg-connector/lg-connector.log|' util/log.js

npm start
