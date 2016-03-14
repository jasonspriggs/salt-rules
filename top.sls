base:
  '*':
    - managed
    - managed.update
    - branding
    - login.admin
    - login.ssh
    - network.time
    - demo

  'vegasix.hackafe.net':
    - httpd.nginx
    - containers
    - network.bridge
    - voip
    - aur

  'watson.hackafe.net':
    - httpd.nginx
    - containers
    - network.bridge
    - voip
    - aur

  'cheerilee.hackafe.net':
    - audio
    - aur
    - rpi.gpio
    - homeautomation.openhalper
    - music.pianobar

  'luna.hackafe.net':
    - audio
    - audio.pulse
    - cups
    - aur
    - rpi.gpio
    - homeautomation.i2c
    - homeautomation.cec
    - homeautomation.openhalper
    - ci.slave

  'scootaloo.hackafe.net':
    - aur
    - rpi.gpio
    - homeautomation.openhalper
    - network.dhcp
    - network.wifi
    - network.wifi.rtl-8192

  'vinyl.hackafe.net':
    - aur
    - rpi.gpio
    - homeautomation.openhalper

  'fluttershy.hackafe.net':
    - audio
    - network.wifi
    - network.wifi.rtl-8192

  'spike.hackafe.net':
    - aur
    - rpi.gpio
    - network.wifi
    - network.wifi.rtl-8192
    - homeautomation.openhalper

  'pinkie.hackafe.net':
    - aur
    - rpi.gpio
    - homeautomation.openhalper

  'icinga.hackafe.net':
    - aur
    - monitor.server

  'rarity.hackafe.net':
    - aur
    - rpi.gpio
    - audio
    - homeautomation.openhalper

  'dash.hackafe.net':
    - aur
    - rpi.gpio
    - homeautomation.openhalper

  'thegreatandpowerfultrixie.hackafe.net':
    - aur
    - rpi.gpio
    - homeautomation.garage
    - homeautomation.openhalper

  'ci':
    - ci.jenkins

  'ci-buildslave1.hackafe.net':
    - ci.slave

  'logs':
    - logging.server

  'ldap.hackafe.net':
    - aur

  'repo.hackafe.net':
    - aur
    - httpd.darkhttpd
