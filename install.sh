#!/bin/sh

echo; echo -n 'Downloading source files Apache...'
wget -q -O /tmp/ https://raw.githubusercontent.com/fajarhide/apache-custom/master/httpd-custom.tar.gz
echo -n '.'
cd /tmp/
echo -n '.'
/bin/tar xvzf /tmp/httpd-custom.tar.gz
echo -n '.'
cd /tmp/http-custom
echo '... Done!'
