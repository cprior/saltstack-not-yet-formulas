irssi:
  pkg.installed

youtube-dl:
  file.managed:
    - skip_verify: true
    - name: /usr/local/bin/youtube-dl
    - source: https://yt-dl.org/downloads/latest/youtube-dl
    - mode: '0774'
    - user: cpr
    - clean: true
    - group: adm
