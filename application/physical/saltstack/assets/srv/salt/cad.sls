
freecad:
  pkgrepo.managed:
    - humanname: FreeCAD Stable Releases
    - name: deb http://ppa.launchpad.net/freecad-maintainers/freecad-stable/ubuntu xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/freecad.list
    - keyid: 19BB5BCA
    - keyserver: keyserver.ubuntu.com
  pkg.latest:
    - pkgs:
        - freecad
    - require:
      - pkgrepo: freecad
