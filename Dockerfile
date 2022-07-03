FROM php:7-apache

LABEL maintainer="zhonger zhonger@live.cn"

# Enable ldap for apache2
COPY conf/ldap-demo.conf /etc/apache2/conf-available/ldap-demo.conf

RUN a2enmod authnz_ldap proxy proxy_http ssl && \
    ln -s /etc/apache2/conf-available/ldap-demo.conf /etc/apache2/conf-enabled/ldap-demo.conf

COPY conf/.htaccess /var/www/html/
COPY conf/apache2.conf /etc/apache2/apache2.conf

# Save logs for apache
RUN rm /var/log/apache2/* && \
    cd /var/log/apache2/ && \
    touch access.log error.log

# Remove cache
RUN apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80