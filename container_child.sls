{% if pillar.containerhosts %}
{% for container_list in pillar.containerhosts %}
{% if grains['host'] in container_list %}
is_container:
  grains.present:
    - value: True
{% endif %}
{% endfor %}
{% endif %}
