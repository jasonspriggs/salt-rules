salt-minion:
  service.running:
    - enable: True

puppet:
  service.dead:
    - enable: False

salt-group:
  group.present:
    - name: salt
    - system: True
