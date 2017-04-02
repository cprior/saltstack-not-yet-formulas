include:
  - python2
  - python3

pip3fordataanalysis:
  pkg.latest:
    {% if grains['os'] == 'Ubuntu' %}
    - name: python3-pip 
    {% endif %}

dataanalysis python3-numpy:
  pkg.installed:
    - name: python3-numpy

dataanalysis python3-pandas:
  pkg.installed:
    - name: python3-pandas

dataanalysis python3-matplotlib:
  pkg.installed:
    - name: python3-matplotlib

geopandas python3:
  pip.installed:
    - name: geopandas
    - bin_env: '/usr/bin/pip3'
#    - upgrade: True
    - require:
      - pkg: pip3

geocoder python3:
  pip.installed:
    - name: geocoder
    - bin_env: '/usr/bin/pip3'
#    - upgrade: True
    - require:
      - pkg: pip3

csvkit3:
  pip.installed:
    - name: csvkit
    - upgrade: True
    - require:
      - pkg: pip3

csvkit2:
  pip.installed:
    - name: csvkit
    - upgrade: True
    - require:
      - pkg: pip2
