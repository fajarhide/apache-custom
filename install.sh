#!/bin/sh
echo -n 'Installing Dependency ...'
echo ''
echo ''
yum install gcc openssl-devel apr-devel apr-util-devel mysql-server php-mysql -y
sleep 6;
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
sleep 5;
echo ''
echo -n '... Running Installing Apache'
sleep 2;
echo ''
/bin/bash /tmp/apache-custom/configure --prefix=/usr/local/apache2-custom --enable-ssl=static --with-mysql --with-ssl=/usr/lib64/openssl/
sleep 2;
make && make install
sleep 5;
echo ''
echo -n '... Finish Installing Apache!'
sleep 2;
echo -n '... Configure Apache-Custom Running'
sleep 2;
rm -Rf /usr/local/apache2-custom/conf/httpd.conf
rm -Rf /usr/local/apache2-custom/conf/extra/http-mpm.conf
cp /tmp/apache-custom/file/libphp5.so /usr/local/apache2-custom/modules/
rm -Rf /usr/sbin/rotatelogs
wget -q -O /usr/sbin/rotatelogs https://raw.githubusercontent.com/fajarhide/apache-custom/master/file/rotatelogs
chmod +x /usr/sbin/rotatelogs
wget -q -O /usr/local/apache2-custom/conf/httpd.conf https://raw.githubusercontent.com/fajarhide/apache-custom/master/conf/httpd.conf
wget -q -O /usr/local/apache2-custom/conf/extra/http-mpm.conf https://raw.githubusercontent.com/fajarhide/apache-custom/master/conf/extra/http-mpm.conf
echo '... Configuration Apache-Custom finished!'
sleep 2;
echo -n '... Starting Apache-Custom..'
sleep 2;
mkdir -p /var/www/html
wget -q -O /var/www/html/index.php https://raw.githubusercontent.com/fajarhide/apache-custom/master/file/index.php
chmod +x /var/www/html/index.php
/usr/local/apache2-custom/bin/apachectl -k start
sleep 5;
clear
echo ''
echo '... Great Jobs..!'
echi '... Your Apache-Custom for PHP5 have a running use port on Default (80) !'
echo '... You can access on http://localhost/ or http://yourdomain'
echo ''
echo '... Usage Apache-Custom (command) : '
echo '... ------------------------------- '
echo '... Start: /usr/local/apache2-custom/bin/apachectl -k start '
echo '... Stop: /usr/local/apache2-custom/bin/apachectl -k stop '
echo '... Graceful: /usr/local/apache2-custom/bin/apachectl -k graceful '
echo '... Graceful: /usr/local/apache2-custom/bin/apachectl -k restart '
echo ''
rm -Rf install.sh
rm -Rf /tmp/apache-custom