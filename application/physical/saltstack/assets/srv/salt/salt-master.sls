{% if grains['os'] == 'Ubuntu' %}
cmake:
  pkgrepo.managed:
    - humanname: cmake
    - name: deb http://ppa.launchpad.net/george-edison55/cmake-3.x/ubuntu xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/cmake.list
    - keyid: 828AB726
    - keyserver: keyserver.ubuntu.com
  pkg.installed:
    - pkgs:
        - cmake
    - require:
      - pkgrepo: cmake
{% endif %}

libcurl4-openssl-dev:
  pkg.installed

libssl-dev:
  pkg.installed

libhttp-parser-dev:
  pkg.installed

libssh2-1-dev:
  pkg.installed

python-cffi:
  pkg.installed

pygit2:
  pip.installed:
    - bin_env: /usr/bin/pip2

this-is-needed-for-libgit2-to-be-found-by-pygit:
  cmd.run:
    - name: sudo ldconfig

/etc/salt/master.d:
  file.directory

setting-some-file-roots:
  file.managed:
    - name: /etc/salt/master.d/90_file_roots.conf
    - source: salt://files/salt-masterd-90_file_roots.conf

setting-some-gitfs-roots:
  file.managed:
    - name: /etc/salt/master.d/90_gitfs_remotes.conf
    - source: salt://files/salt-masterd-90_gitfs_remotes.conf

setting-some-ext_pillar:
  file.managed:
    - name: /etc/salt/master.d/90_ext_pillar.conf
    - source: salt://files/salt-masterd-90_ext_pillar.conf

salt-master:
  service:
    - running
    - watch:
       - file: /etc/salt/master.d/90_file_roots.conf
       - file: /etc/salt/master.d/90_gitfs_remotes.conf
