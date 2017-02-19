inkscape:
  pkgrepo.managed:
    - humanname: Inkscape Stable
    - name: deb http://ppa.launchpad.net/inkscape.dev/stable/ubuntu xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/inkscape.list
    - keyid: B9A06DE3
    - keyserver: keyserver.ubuntu.com
  pkg.installed:
    - pkgs:
        - inkscape
    - require:
      - pkgrepo: inkscape
