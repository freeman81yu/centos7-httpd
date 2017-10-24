#!/bin/bash

yum update -y
yum install httpd

mkdir -p /etc/httpd/sites-available
mkdir -p /etc/httpd/sites-enabled
mkdir -p /var/www/support.hyperoptic.com/public_html

echo "IncludeOptional sites-enabled/*.conf" >> /etc/httpd/conf/httpd.conf
cp support.hyperoptic.com.conf /etc/httpd/conf/httpd/sites-available
cp index.html /var/www/support.hyperoptic.com/public_html/

sudo ln -s /etc/httpd/sites-available/support.hyperoptic.com.conf /etc/httpd/sites-enabled/support.hyperoptic.com.conf

systemctl restart httpd