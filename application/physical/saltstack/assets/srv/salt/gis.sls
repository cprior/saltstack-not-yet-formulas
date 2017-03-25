qgis:
  pkgrepo.managed:
    - humanname: QGIS
    - name: deb http://qgis.org/debian xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/qgis.list
    - keyid: 073D307A618E5811
    - keyserver: keyserver.ubuntu.com
  pkg.installed:
    - pkgs:
        - qgis
    - require:
      - pkgrepo: qgis

gdal:
  pkgrepo.managed:
    - humanname: gdal
    - name: deb http://ppa.launchpad.net/ubuntugis/ppa/ubuntu xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/gdal.list
    - keyid: 6B827C12C2D425E227EDCA75089EBE08314DF160
    - keyserver: keyserver.ubuntu.com
  pkg.installed:
    - pkgs:
        - gdal-bin
    - require:
      - pkgrepo: gdal

sqlitebrowser:
  pkg.installed

libxml2:
  pkg.installed

libxml2-dev:
  pkg.installed


#libxml-ruby builder osmlib-base osmlib-export osmlib-sqlite
{% for item in ['libxml-ruby', 'builder', 'osmlib-base', 'osmlib-export', 'osmlib-sqlite'] %}
{{ item }}:
  gem.installed
{% endfor %}


osmosis:
  archive.extracted:
    - name: /opt/osmosis-latest
    - enforce_toplevel: False
    - source: http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.tgz
#    - skip_verify: true
    - source_hash: md5=956ab8fc8e9634b5420ddba0e3397d8c
    - source_hash_update: True
    - group: adm
    - require_in:
      - file: /usr/local/bin/osmosis

/usr/local/bin/osmosis:
  file.symlink:
    - group: adm
    - target: /opt/osmosis-latest/bin/osmosis

osmosis-0.35:
  archive.extracted:
    - name: /opt/osmosis-0.35
    - enforce_toplevel: False
    - source: http://dev.openstreetmap.org/~bretth/osmosis-build/osmosis-0.35.tgz
    - source_hash: md5=0cc96511cac5e29f9c23e23dd84a1eec
#    - source_hash_update: True
    - group: adm
    - require_in:
      - file: /usr/local/bin/osmosis-0.35
      - file: /opt/osmosis-0.35/osmosis-0.35/bin/osmosis

/opt/osmosis-0.35/osmosis-0.35/bin/osmosis:
  file.managed:
    - group: adm
    - mode: 775

/usr/local/bin/osmosis-0.35:
  file.symlink:
    - group: adm
    - target: /opt/osmosis-0.35/osmosis-0.35/bin/osmosis

viking:
  pkg.installed

/opt/josm:
  file.directory:
    - user: root
    - group: adm
    - dir_mode: 775
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
    - makedirs: True

/opt/josm/josm-tested.jar:
  file.managed:
    - skip_verify: true
    - source: http://josm.openstreetmap.de/download/josm-tested.jar

make-josm-executable:
  cmd.run:
    - name: chmod +x /opt/josm/josm-tested.jar

/opt/josm/josm.jar:
  file.symlink:
    - group: adm
    - target: /opt/josm/josm-tested.jar

gpsbabel:
  pkg.installed

gpsbabel-gui:
  pkg.installed
