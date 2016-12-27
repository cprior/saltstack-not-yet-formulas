
browser:
  pkg.installed:
    - name: chromium-browser

shutter:
  pkg.installed:
    - name: shutter


x2go:
  pkgrepo.managed:
    - humanname: x2go/stable
    - name: "deb http://ppa.launchpad.net/x2go/stable/ubuntu xenial main"
    - dist: xenial
    - file: /etc/apt/sources.list.d/x2go.list
    - keyid: 0A53F9FD
    - keyserver: keyserver.ubuntu.com
  pkg.installed:
    - pkgs:
        - x2goserver
        - x2goserver-xsession
        - x2golxdebindings
        - lxde
        - x2goclient
    - require:
      - pkgrepo: x2go
