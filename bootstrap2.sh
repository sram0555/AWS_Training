#!/bin/bash
yum install -y httpd php git

cd /var/www/html
wget https://raw.githubusercontent.com/sram0555/AWS_Training/master/cat2.jpg
mv cat2.jpg cat.jpg
wget https://github.com/sram0555/AWS_Training/blob/master/index.php
mv /var/www/html/htaccess /var/www/html/.htaccess


mkdir /var/www/html/cat
cp /var/www/html/cat.jpg /var/www/html/cat
cp /var/www/html/index.php /var/www/html/cat
cp /var/www/html/.htaccess /var/www/html/cat

sudo systemctl start httpd
sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
