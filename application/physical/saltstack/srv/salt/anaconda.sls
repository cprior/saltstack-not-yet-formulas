#https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
#http://stackoverflow.com/a/41161272


/opt/Anaconda2:
  cmd.script:
    - name: /srv/salt/files/Anaconda2-4.2.0-Linux-x86_64.sh
    - args: -b -p /opt/Anaconda2
    - creates: /opt/Anaconda2
    - require:
      - file: /srv/salt/files/Anaconda2-4.2.0-Linux-x86_64.sh

get installer for Anaconda2:
  file.managed:
    - name: /srv/salt/files/Anaconda2-4.2.0-Linux-x86_64.sh
    - skip_verify: true
    - source: https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
    - creates: /opt/miniconda2
