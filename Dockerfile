FROM ubuntu

RUN apt-get update && apt-get install -y vim less net-tools apache2

EXPOSE 80 443

RUN a2enmod proxy_http proxy_connect

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

CMD service apache2 start && tail -F /var/log/apache2/*.log

