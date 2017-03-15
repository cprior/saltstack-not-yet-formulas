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
