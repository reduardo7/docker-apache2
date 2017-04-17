# Creates apache install 
#
# Author: Paul Czarkowski
# Date: 08/11/2013


FROM ubuntu:12.04
MAINTAINER Paul Czarkowski "paul@paulcz.net"

RUN apt-get update

RUN apt-get -y install apache2

env APACHE_RUN_USER    www-data
env APACHE_RUN_GROUP   www-data
env APACHE_PID_FILE    /var/run/apache2.pid
env APACHE_RUN_DIR     /var/run/apache2
env APACHE_LOCK_DIR    /var/lock/apache2
env APACHE_LOG_DIR     /var/log/apache2
env LANG               C

RUN echo 'ServerName localhost' > /etc/apache2/conf-available/server-name.conf
RUN a2enconf server-name

CMD ["apache2", "-D", "FOREGROUND"]
