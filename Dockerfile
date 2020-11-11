FROM php:7.4.2-apache
RUN pecl install xdebug && docker-php-ext-enable xdebug \
    && echo "\n\
    zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20160303/xdebug.so \n\
    xdebug.remote_host = "host.docker.internal" \n\
    xdebug.idekey=VSCODE \n\
    xdebug.default_enable = 1 \n\
    xdebug.remote_autostart = 1 \n\
    xdebug.remote_connect_back = 0 \n\
    xdebug.remote_enable = 1 \n\
    xdebug.remote_handler = "dbgp" \n\
    xdebug.remote_port = 9000 \n\
    xdebug.remote_log = /usr/local/etc/php/xdebug.log \n\
    " >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini