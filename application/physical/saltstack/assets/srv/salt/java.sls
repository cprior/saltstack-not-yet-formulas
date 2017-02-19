#https://gist.github.com/renoirb/6722890

#debconf-utils:
#  pkg.installed
#
#oracle-java{{ pillar['java_version'] }}-installer:
#  pkgrepo.managed:
#    - humanname: WebUp8Team Java Repository
#    - name: "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main"
#    - dist: xenial
#    - file: /etc/apt/sources.list.d/webup8team.list
#    - keyid: EEA14886
#    - keyserver: keyserver.ubuntu.com
#  pkg.installed:
#    - require:
#      - pkgrepo: oracle-java{{ pillar['java_version'] }}-installer
#  debconf.set:
#   - data:
#       'shared/accepted-oracle-license-v1-1': {'type': 'boolean', 'value': True}
#   - require_in:
#       - pkg: oracle-java{{ pillar['java_version'] }}-installer
#
#make it NOT default:
#  pkg.purged:
#    - name: oracle-java8-set-default


openjdk-jdk: 
  pkg.installed:
    {% if grains['os'] == 'Gentoo' %} 
    - name: virtual/jdk:8 
    {% elif grains['os'] == 'Ubuntu' %} 
    - name: openjdk-{{ pillar['java_version'] }}-jdk 
    {% elif grains['os'] == 'Arch ARM' %} 
    - name: jre{{ pillar['java_version'] }}-openjdk 
    {% else %} 
    - name: java8_failthis 
    {% endif %}

