

/opt/processing:
  file.directory:
    - name: /opt/processing
    - user: cpr
    - group: adm


osmosis:
  archive.extracted:
    - name: /opt/processing
    - enforce_toplevel: False
    - source: http://download.processing.org/processing-3.3-linux64.tgz
    - skip_verify: true
#    - source_hash: md5=956ab8fc8e9634b5420ddba0e3397d8c
#    - source_hash_update: True
    - group: adm

