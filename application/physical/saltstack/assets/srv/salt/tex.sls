{% if grains['os'] == 'Ubuntu' %}
{% for item in ['texlive','texlive-lang-german', 'texlive-doc-de', 'texlive-latex-extra'] %}
{{ item }}:
  pkg.installed
{% endfor %}
{% endif %}
