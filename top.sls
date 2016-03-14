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
    - homeautomation.openhab
    - containers
    - network.bridge
    - voip
    - aur

  'cheerilee.hackafe.net':
    - audio
    - homeautomation.openhalper
    - music.pianobar

  'luna.hackafe.net':
    - audio
    - audio.pulse
    - aur
    - homeautomation.openhalper

  'scootaloo.hackafe.net':
    - aur
    - homeautomation.openhalper
    - network.dhcp
    - network.wifi
    - network.wifi.rtl-8192

  'vinyl.hackafe.net':
    - aur
    - homeautomation.openhalper

  'fluttershy.hackafe.net':
    - audio
    - network.wifi
    - network.wifi.rtl-8192

  'spike.hackafe.net':
    - aur
    - network.wifi
    - network.wifi.rtl-8192
    - homeautomation.openhalper

  'pinkie.hackafe.net':
    - aur
    - homeautomation.openhalper

  'icinga.hackafe.net':
    - aur
    - monitor.server

  'rarity.hackafe.net':
    - aur
    - audio
    - homeautomation.openhalper

  'dash.hackafe.net':
    - aur
    - homeautomation.openhalper

  'thegreatandpowerfultrixie.hackafe.net':
    - aur
    - homeautomation.openhalper

  'ci':
    - ci.jenkins

  'logs':
    - logging.server
