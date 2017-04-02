{{ pillar['editor'] }}:
  pkg.installed

{% if pillar['editor'] == 'vim' %}
nano:
  pkg.purged
emacs:
  pkg.purged
{% elif pillar['editor'] == 'nano' %}
emacs:
  pkg.purged
{% endif %}
