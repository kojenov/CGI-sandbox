#!/bin/bash

echo "Installing packages..."
apt-get update -q
apt-get install -y -q apache2 libapache2-mod-perl2 perl curl dos2unix

echo "Configuring web server..."

# stop the server
service apache2 stop

# add ServerName option to suppress warning
echo "ServerName cgi" >> /etc/apache2/apache2.conf

# enable CGI and Perl modules
a2enmod cgid
a2enmod perl

# create cgi-bin directory owned by regular user ubuntu
mkdir -p /var/www/cgi-bin
chown -R ubuntu:ubuntu /var/www

# change Apache's runtime user to ubuntu
sed -i 's/=www-data/=ubuntu/' /etc/apache2/envvars

# save the original default config
mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.sav

# write the new default config
cat << EOF > /etc/apache2/sites-available/000-default.conf
  <VirtualHost *:80>
    DocumentRoot /var/www/html
    ScriptAlias /cgi-bin/ /var/www/cgi-bin/
    <Directory "/var/www/cgi-bin">
      Options +ExecCGI
      Order allow,deny
      Allow from all
    </Directory>
  </VirtualHost>
EOF

# start the server
service apache2 start
