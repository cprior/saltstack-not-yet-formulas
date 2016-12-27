python2:
  pkg.installed:
    {% if grains['os'] == 'Ubuntu' %}
    - name: python
    {% endif %}

pip2:
  pkg.installed:
    {% if grains['os'] == 'Ubuntu' %}
    - name: python-pip 
    {% endif %}

virtualenv2:
  pkg.installed:
    {% if grains['os'] == 'Ubuntu' %}
    - name: virtualenv
    {% endif %}
