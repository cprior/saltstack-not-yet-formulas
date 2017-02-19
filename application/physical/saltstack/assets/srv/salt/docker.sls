docker-installer:
  {% if grains['os'] == 'Ubuntu' %}
  # https://docs.docker.com/engine/installation/linux/ubuntulinux/
##    - humanname: LibreOffice Fresh
#    - name: deb https://apt.dockerproject.org/repo ubuntu-xenial main
#    - dist: xenial
#    - file: /etc/apt/sources.list.d/docker.list
#    - keyid: 58118E89F3A912897C070ADBF76221572C52609D
#    - keyserver: p80.pool.sks-keyservers.net
#    - refresh_db: True
  pkg.installed:
    - pkgs:
        - apt-transport-https
        - ca-certificates
        - docker-engine
  {% elif grains['os'] == 'Arch ARM' %}
  #https://docs.docker.com/engine/installation/linux/archlinux/
  pkg.installed:
    - name: docker
  {% endif %}


docker-compose-installer:
  cmd.run:
    - name: curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
