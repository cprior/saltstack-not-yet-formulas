#http://askubuntu.com/a/767436

install Visual Studio Code:
  cmd.run:
    - name: dpkg -i /srv/salt/files/code.deb
    - unless: dpkg -s code
    - require:
      - file: /srv/salt/files/code.deb

#curl -I https://go.microsoft.com/fwlink/?LinkID=760868
#Location: https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable
/srv/salt/files/code.deb:
  file.managed:
    - skip_verify: true
    - source: https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable
