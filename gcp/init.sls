gcp-cups-connector:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: gcp-cups-connector-systemd
      - file: /etc/gcp-cups-connector.config.json
      - file: gcp-cups-connector-override
      - sls: cups

gcp-cups-connector-systemd:
  pkg.installed

gcp-cups-connector-override:
  file.managed:
    - name: /etc/systemd/system/gcp-cups-connector.service.d/override.conf
    - makedirs: True
    - source: salt://gcp/gcp-cups-connector.override
    - watch_in:
      - cmd: daemon-reload
    - require:
      - pkg: gcp-cups-connector-systemd

/etc/gcp-cups-connector.config.json:
  file.managed:
    - source: salt://gcp/gcp-cc-conf.json
    - template: jinja
