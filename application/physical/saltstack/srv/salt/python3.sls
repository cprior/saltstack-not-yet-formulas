python3:
  pkg.installed:
    {% if grains['os'] == 'Ubuntu' %}
    - name: python3
    {% endif %}

pip3:
  pkg.installed:
    {% if grains['os'] == 'Ubuntu' %}
    - name: python3-pip 
    {% endif %}

pip3-needs-pip2:
  pkg.installed:
    {% if grains['os'] == 'Ubuntu' %}
    - name: python-pip 
    {% endif %}

virtualenv3:
  pkg.installed:
    {% if grains['os'] == 'Ubuntu' %}
    - name: python3-venv
    {% endif %}

jupyter notebook python3:
  pip.installed:
    - name: jupyter
    - bin_env: '/usr/bin/pip3'
#    - upgrade: True
    - require:
      - pkg: pip3
      - pkg: pip3-needs-pip2
