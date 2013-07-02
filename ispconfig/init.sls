include:
  - ispconfig.mail
  - ispconfig.dns
  - ispconfig.db
  - ispconfig.web

fail2ban:
  pkg:
    - installed
  service.running:
    - enabled: True

rkhunter:
  pkg.installed

utils:
  pkg.installed:
    - names:
      - unzip
      - bzip2
      - zip
      - lynx
      - mc
      - strace
      - htop
      - tcpdump
      - nc

get-ispconfig-distrib:
  cmd.run:
    - name: wget http://www.ispconfig.org/downloads/ISPConfig-3-stable.tar.gz
    - cwd: /root
    - unless: test -f ISPConfig-3-stable.tar.gz || test -d ispconfig3_install

untar-ispconfig-distrib:
  cmd.run:
    - name: tar xf ISPConfig-3-stable.tar.gz
    - cwd: /root
    - unless: test -d ispconfig3_install
    - require:
      - cmd: get-ispconfig-distrib