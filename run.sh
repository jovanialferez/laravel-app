#!/bin/sh
cp /var/www/.env.example /var/www/.env

chmod -R 777 /var/www/storage
chmod -R 777 /var/www/bootstrap/cache

cd /var/www && /usr/bin/composer install && /usr/bin/php artisan migrate && /usr/bin/php artisan passport:keys

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf