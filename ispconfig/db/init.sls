mysqld:
  pkg.installed:
    - name: mysql-server
  service.running:
    - enabled: True
