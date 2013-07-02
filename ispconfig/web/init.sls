httpd:
  pkg.installed:
    - names:
      - httpd
      - mod_ssl
      - mod_fcgid
  service.running:
    - enabled: True

ImageMagick:
  pkg.installed

php-modules:
  pkg.installed:
    - require:
      - pkg: httpd
    - names:
      - php
      - php-cli
      - php-mysql
      - php-mbstring
      - php-gd
      - php-imap
      - php-xml
      - php-xmlrpc
      - php-mcrypt
      - php-soap
      - php-tidy

phpMyAdmin:
  pkg.installed:
    - require:
      - pkg: httpd

pure-ftpd:
  pkg:
    - installed
  service.running:
    - enabled: True

webstat:
  pkg.installed:
    - require:
      - pkg: httpd
    - names:
      - webalizer
      - awstats
      - perl-DateTime-Format-HTTP
      - perl-DateTime-Format-Builder
