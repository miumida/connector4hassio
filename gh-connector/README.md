# Hass.io Add-on: GH-Connector 


![Supports amd64 Architecture][amd64-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports gh-connector Architecture][gh-connector-shield]
![Supports addons Architecture][addons-shield]


### About
아기나무집님이 만드신 gh-connector 프로그램을 애드온으로 만든 것입니다.
<br><br>

### Version : 1.0.0(dev)
개발중입니다:'D

### Mount
|gh-connector|addon|
|--|--|
| /config | /config
| /music1 | /share/gh-connector/music |

### Changed File Path
|gh-connector|addon|
|--|--|
| /config/gh-config.json | /config/gh-connector/gh-config.json |
| /config/gh-connector.log | /config/gh-connector/gh-connector.log |

### Installation
1. Supervisor > ADD-ON STORE에서 Add new repository by URL에 '<https://github.com/miumida/connector4hassio>' 입력 후, "ADD" 버튼을 클릭하여 추가합니다.
2. ADD-ON STORE 페이지 하단에서 "-Connector" 클릭합니다.
3. "INSTALL" 버튼을 누르면 애드온이 설치됩니다.
<br><br>

### Reference Site
- 아기나무집님의 GH-Connector github (https://github.com/fison67/GH-Connector)
- dockerhub의 fison67/gh-connector (https://hub.docker.com/r/fison67/gh-connector)

[forum]: https://cafe.naver.com/koreassistant
[github]: https://github.com/HAKorea/addons
[issue]: https://github.com/zooil/wallpadRS485/issues
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

[addons-shield]: https://img.shields.io/badge/addons-1.0.0-orange.svg
[gh-connector-shield]: https://img.shields.io/badge/ghconnector-0.0.5-orange.svg
