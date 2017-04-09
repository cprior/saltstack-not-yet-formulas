
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

librecad:
  pkgrepo.managed:
    - humanname: Stable LibreCAD packages
    - name: deb http://ppa.launchpad.net/librecad-dev/librecad-stable/ubuntu xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/librecad.list
    - keyid: E395A5ED
    - keyserver: keyserver.ubuntu.com
  pkg.latest:
    - pkgs:
        - librecad
    - require:
      - pkgrepo: librecad
