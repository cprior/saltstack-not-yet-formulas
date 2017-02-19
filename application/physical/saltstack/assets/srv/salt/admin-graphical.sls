{% if grains['os'] == 'Ubuntu' %}
gparted:
  pkg.installed
{% endif %}
