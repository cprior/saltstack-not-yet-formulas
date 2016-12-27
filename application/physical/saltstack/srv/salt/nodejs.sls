npm:
  pkg.installed


{% if grains['os'] == 'Gentoo' %} 
dependencies:
  pkg.installed:
    - pkgs:
        - lib32z1
        - lib32ncurses5
{% endif %}

#hint how to install nvm:
#  test.show_notification:
#    - name: nvm installation instructions
#    - text: Run curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash to install nvm as user

nvm:
  cmd.run:
    - name: export NVM_DIR=/usr/local/nvm && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

node-lts:
  cmd.run:
    - name: export NVM_DIR=/usr/local/nvm && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && nvm install --lts
