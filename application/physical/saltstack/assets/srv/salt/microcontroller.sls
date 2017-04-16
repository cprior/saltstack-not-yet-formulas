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


include:
  - python2
  - python3

esptool python3:
  pip.installed:
    - name: esptool
    - bin_env: '/usr/bin/pip3'
    - upgrade: True
    - require:
      - pkg: pip3

pyserial python3:
  pip.installed:
    - name: pyserial
    - bin_env: '/usr/bin/pip3'
    - upgrade: True
    - require:
      - pkg: pip3

pyserial ipython2:
  pip.installed:
    - name: pyserial
    - bin_env: '/usr/bin/pip'
    - upgrade: True
    - require:
      - pkg: pip2


{% if grains['os'] == 'Ubuntu' %}
#https://github.com/pfalcon/esp-open-sdk
{% for item in ['make' ,'unrar-free' ,'autoconf' ,'automake' ,'libtool' ,'gcc' ,'g++' ,'gperf' ,'flex' ,'bison' ,'texinfo' ,'gawk' ,'ncurses-dev' ,'libexpat-dev' ,'python-dev' ,'python' ,'python-serial' ,'sed' ,'git' ,'unzip' ,'bash' ,'help2man' ,'wget' ,'bzip2', 'libtool-bin'] %}
{{ item }}:
  pkg.installed
{% endfor %}

{% endif %}


/opt/esp-open-sdk:
  file.directory:
    - user: cpr
    - group: adm
    - dir_mode: 2775
    - file_mode: 664
esp-open-sdk.git: 
  git.latest: 
    - name: https://github.com/pfalcon/esp-open-sdk.git
    - target: /opt/esp-open-sdk
    - submodules: True
    - user: cpr

/opt/micropython:
  file.directory:
    - user: cpr
    - group: adm
    - dir_mode: 2775
    - file_mode: 664
micropython.git:
  git.latest:
    - name: https://github.com/micropython/micropython.git
    - target: /opt/micropython
    - submodules: True
    - user: cpr


micropython.git_preparation:
  cmd.run:
    - cwd: /opt/micropython
    - name: git submodule update --init && make -C mpy-cross 
micropython.git_build:
  cmd.run:
    - cwd: /opt/micropython/esp8266
    - name: make axtls && make


