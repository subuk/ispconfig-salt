dovecot:
  pkg.installed:
    - names:
      - dovecot
      - dovecot-mysql
  service.running:
    - enabled: True

sendmail:
  pkg.purged:
    - name: sendmail
  service.dead:
    - enabled: False

postfix:
  pkg.installed:
    - name: postfix
    - require:
      - pkg: sendmail
  service.running:
    - enabled: True

getmail:
  pkg.installed

amavis:
  pkg.installed:
    - names:
      - amavisd-new
      - spamassassin
      - clamav
      - clamd 
      - perl-DBD-MySQL
  service.running:
    - enabled: True
    - names:
      - amavisd
      - clamd.amavisd

clamd:
  service.dead:
    - require:
      - pkg: amavis

squirrelmail:
  pkg.installed:
    - require:
      - pkg: httpd

/etc/squirrelmail/config.php:
  file.managed:
    - source: salt://ispconfig/mail/squirrelmail/config.php
    - require:
      - pkg: squirrelmail

/etc/squirrelmail/config_local.php:
  file.managed:
    - source: salt://ispconfig/mail/squirrelmail/config_local.php
    - require:
      - pkg: squirrelmail


