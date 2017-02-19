#umake android

cordova:
  npm.installed:
    - require:
      - pkg: npm

ionic:
  npm.installed:
    - require:
      - pkg: npm
