Apache-Custom 
=============

Apache custom installation on web server

Versions
--------

Apache-Custom v1.0 by: 2015, fajarhide

Depedency
---------

yum install mysql-server php-mysql -y

yum install gcc openssl-devel apr-devel apr-util-devel

Configure
---------

~# tar xvzf http-custom.tar.gz
~# cd http-custom/
~# ./configure --prefix=/usr/local/apache_custom/ --enable-ssl=static --with-mysql --with-ssl=/usr/lib64/openssl/
~# /usr/local/apache_custom/bin/apachectl -k start

