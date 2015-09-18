#!/bin/sh
echo -n 'Install Dependency'
yum install gcc openssl-devel apr-devel apr-util-devel mysql-server php-mysql -y
sleep 5;
echo ''
echo ''
echo; echo -n 'Downloading source files Apache...'
mkdir -p /tmp/apache-custom
echo -n '.'
cd /tmp/apache-custom
echo -n '.'
wget https://raw.githubusercontent.com/fajarhide/apache-custom/master/httpd-custom.tar.gz
echo -n '.'
/bin/tar xvzf /tmp/apache-custom/httpd-custom.tar.gz
echo -n '.'
sleep 5
echo ''
echo ''
echo ''
echo '... Done Package Apache on directory /tmp/apache-custom/ !'
echo '... Run Command by "root" user following ...'
echo '... ----------------------------------------'
echo '... # cd /tmp/apache-custom/httpd-custom/'
echo '... # /bin/bash /tmp/apache-custom/httpd-custom/configure --prefix=/usr/local/apache2_directory-custom/ --enable-ssl=static --with-mysql --with-ssl=/usr/lib64/openssl/'
echo '... # make && make install'
echo ''