/opt/idiotic:
  file.directory:
    - makedirs: True

idiotic-repo:
  git.latest:
    - name: https://github.com/umbc-hackafe/idiotic.git
    - target: /opt/idiotic
    - require:
      - file: /opt/idiotic
    - watch_in:
      - service: idiotic

/usr/lib/systemd/system/idiotic.service:
  file.copy:
    - source: /opt/idiotic/contrib/idiotic.service
    - force: True
    - makedirs: True
    - require:
      - git: idiotic-repo
    - watch_in:
      - cmd: daemon-reload
      - service: idiotic

/etc/idiotic:
  file.directory:
    - makedirs: True

idiotic-config-repo:
  git.latest:
    - name: https://github.com/umbc-hackafe/idiotic-config.git
    - force_clone: True
    - target: /etc/idiotic
    - require:
      - file: /etc/idiotic
    - watch_in:
      - service: idiotic

/etc/idiotic/conf.json:
  file.managed:
    - source: salt://homeautomation/idiotic-conf.json
    - template: jinja
    - require:
      - file: /etc/idiotic
      - git: idiotic-config-repo
    - watch_in:
      - service: /etc/idiotic

idiotic:
  service.running:
    - enable: True
    - require:
      - git: idiotic-repo
      - git: idiotic-config-repo
      - file: /etc/idiotic/conf.json
