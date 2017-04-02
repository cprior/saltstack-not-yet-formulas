#umake android

cordova:
  npm.installed:
    - require:
      - pkg: npm

ionic:
  npm.installed:
    - require:
      - pkg: npm

android-tools-adb:
  pkg.installed

android-tools-fastboot:
  pkg.installed
