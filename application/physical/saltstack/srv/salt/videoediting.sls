blender-installer:
  {% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - humanname: Thomas Schiex Blender Repo
    - name: deb http://ppa.launchpad.net/thomas-schiex/blender/ubuntu xenial main 
    - dist: xenial
    - file: /etc/apt/sources.list.d/blender.list
    - keyid: 42A98114
    - keyserver: keyserver.ubuntu.com
  pkg.installed:
    - name: blender
  {% elif grains['os'] == 'Arch ARM' %}
  #https://docs.docker.com/engine/installation/linux/archlinux/
  pkg.installed:
    - name: docker
  {% endif %}




audacity-installer:
  {% if grains['os'] == 'Ubuntu' %}
  pkg.installed:
    - name: audacity
  {% elif grains['os'] == 'Arch ARM' %}
  pkg.installed:
    - name: audacity
  {% endif %}
