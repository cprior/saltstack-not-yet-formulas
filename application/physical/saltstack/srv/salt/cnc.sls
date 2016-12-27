/opt/grblweb:
  file.directory:
    - user: cpr
    - group: cpr
    - dir_mode: 2775
    - file_mode: 664

foo_app: 
  git.latest: 
    - name: https://github.com/andrewhodel/grblweb.git 
    - target: /opt/grblweb 
    - user: cpr

fix a minor bug:
  file.line:
    - name: /opt/grblweb/package.json
    - mode: replace
    - content: ', "serialport" : "4.x"'
    - match: serialport

do stuff:
  cmd.run:
    - env:
      - NVM_DIR: /usr/local/nvm
    - runas: cpr
    - name: export NVM_DIR=/usr/local/nvm && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && nvm use --lts && cd /opt/grblweb && npm install


/opt/grblweb/config.js:
  file.managed:
    - source:
      - salt://files/grblweb/config.js
    - user: cpr
    - group: cpr
    - mode: 644

enable the systemd service:
  service.running:
    - name: grblweb.service
    - enable: true
    - provider: systemd
    - require:
      - file: /etc/systemd/system/grblweb.service

place the systemd unit file in the correct folder:
  file.managed:
    - name: /etc/systemd/system/grblweb.service
    - source: salt://files/grblweb/grblweb.service
