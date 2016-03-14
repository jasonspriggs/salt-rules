salt-minion:
  service.running:
    - enable: True

salt-minion-config:
  file.managed:
    - name: /etc/salt/minion
    - source:
      - salt://managed/minion.yaml
    - template: jinja
    - watched_in:
      - service: salt-minion

puppet:
  service.dead:
    - enable: False

salt-group:
  group.present:
    - name: salt
    - system: True
    {% if pillar.admins %}
    - members:
      {% for admin in pillar.admins.keys() %}
      - {{admin}}
      {% endfor %}
    - require:
      {% for admin in pillar.admins.keys() %}
      - user: {{admin}}
      {% endfor %}
    {% endif %}


daemon-reload:
  cmd.wait:
    - name: systemctl daemon-reload
    - user: root
    - group: root
