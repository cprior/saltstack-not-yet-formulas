arduino:
  pkg.purged

modemmanager:
  pkg.purged

#https://downloads.arduino.cc/arduino-1.8.0-linux64.tar.xz

arduino-gui-installer-1.8:
  file.managed:
    - skip_verify: true
    - name: /srv/salt/files/arduino-1.8.1-linux64.tar.xz
    - source: https://downloads.arduino.cc/arduino-1.8.1-linux64.tar.xz

arduino extracted files:
  archive.extracted:
    - name: /opt/
    - source: salt://files/arduino-1.8.1-linux64.tar.xz
#    - options: v
    - user: cpr
    - clean: true
    - group: cpr

arduino install:
  cmd.run:
    - name: /opt/arduino-1.8.1/install.sh
    - env:
      - HOME: /home/cpr

{% if grains['os'] == 'Ubuntu' %}
cpr:
  user.present:
    - optional_groups:
      - dialout
    - remove_groups: False
{% endif %}
