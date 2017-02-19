hostapd:
  pkg.installed

enable the systemd hostapd service:
  service.running:
    - name: hostapd.service
    - enable: true
    - provider: systemd
    - require:
      - file: /etc/systemd/system/hostapd.service
      - file: /etc/hostapd/hostapd.conf

/etc/hostapd/hostapd.conf:
  file.managed:
    - name: /etc/hostapd/hostapd.conf
    - source: salt://files/hostapd_cnc-grbl-01.conf

place the systemd hostapd unit file in the correct folder:
  file.managed:
    - name: /etc/systemd/system/hostapd.service
    - source: salt://files/hostapd_cnc-grbl-01.service

dnsmasq:
  pkg.installed

enable the systemd dnsmasq service:
  service.running:
    - name: dnsmasq.service
    - enable: true
    - provider: systemd
    - require:
      - file: /etc/systemd/system/dnsmasq.service
      - file: /etc/dnsmasq.conf

/etc/dnsmasq.conf:
  file.managed:
    - name: /etc/dnsmasq.conf
    - source: salt://files/dnsmasq_cnc-grbl-01.conf

place the systemd dnsmasq unit file in the correct folder:
  file.managed:
    - name: /etc/systemd/system/dnsmasq.service
    - source: salt://files/dnsmasq_cnc-grbl-01.service


