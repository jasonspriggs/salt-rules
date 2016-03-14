systemd-nspawn@.service:
  file.managed:
    - name: /etc/systemd/system/systemd-nspawn@.service
    - source: salt://containers/systemd-nspawn@.service
    - require:
      - file: make-container@.service
    - watch_in:
      - cmd: daemon-reload

make-container@.service:
  file.managed:
    - name: /etc/systemd/system/make-container@.service
    - source: salt://containers/make-container@.service
    - require:
      - file: make-container
    - watch_in:
      - cmd: daemon-reload

make-container:
  file.managed:
    - name: /usr/bin/make-container
    - source: salt://containers/make-container.sh
    - mode: 755
    - require:
      - cmd: create-base
      - file: add-minion-config

arch-install-scripts:
  pkg.installed

create-base:
  cmd.run:
    - name: |
        pacstrap -cd /data/baseroot base salt-zmq
        ln -s /data/baseroot/usr/lib/systemd/salt-minion.service /etc/systemd/system/multi-user.target.wants/salt-minion.service
        ln -s /data/baseroot/usr/lib/systemd/systemd-networkd.service /etc/systemd/system/multi-user.target.wants/systemd-networkd.service
        rm /data/baseroot/etc/machine-id
        grep 'pts/0' /data/baseroot/etc/securetty || echo 'pts/0' >> /data/baseroot/etc/securetty
    - unless: test "$(ls -A /data/baseroot)"
    - require:
      - pkg: arch-install-scripts
      - file: /data/baseroot

add-minion-config:
  file.managed:
    - name: /data/baseroot/etc/salt/minion.yaml
    - source: salt://managed/minion.yaml

/data:
  file.directory: []
/data/overlay:
  file.directory: []
/data/work:
  file.directory: []
/data/baseroot:
  file.directory: []


{% if pillar.containerhosts and grains['host'] in pillar.containerhosts %}
{% for container in pillar.containerhosts[grains['host']] %}
{{container}}:
  service.running:
    - name: systemd-nspawn@{{container}}.service
    - enable: True

{% endfor %}
{% endif %}
