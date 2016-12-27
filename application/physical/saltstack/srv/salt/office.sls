libre-office-installer:
  pkgrepo.managed:
    - humanname: LibreOffice Fresh
    - name: "deb http://ppa.launchpad.net/libreoffice/ppa/ubuntu xenial main"
    - dist: xenial
    - file: /etc/apt/sources.list.d/libreoffice.list
    - keyid: 1378B444
    - keyserver: keyserver.ubuntu.com
  pkg.installed:
    - name: libreoffice

