named:
  pkg.installed:
    - names:
      - bind
      - bind-utils
  service.running:
    - enabled: True

/etc/named.conf:
  file.managed:
    - source: salt://ispconfig/dns/named.conf
    - require:
      - pkg: named

/etc/named.conf.local:
  file.managed:
    - user: root
    - require:
      - pkg: named
