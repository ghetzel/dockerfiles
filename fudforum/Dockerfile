FROM    php:7
RUN     apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql pdo_mysql pgsql
ADD     fudforum-3.1.2.tar.gz /tmp/
RUN     mv -v /tmp/fudforum-* /install
ADD     install.ini /install/
RUN     mkdir /app /data
ADD     entrypoint.sh /
WORKDIR /app

EXPOSE 8000

CMD ["/entrypoint.sh"]
