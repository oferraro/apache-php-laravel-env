FROM debian

ENV WORKDIR /var/www/html
WORKDIR $WORKDIR

RUN apt-get update && apt-get install -y apache2 php git \
	php-mbstring php-xml php-zip php-mysql

COPY httpd-foreground install-dev-tools /usr/local/bin/
COPY rebuild-db set-permissions /usr/local/bin/
RUN chmod u+x /usr/local/bin/httpd-foreground \
	/usr/local/bin/set-permissions \
	/usr/local/bin/install-dev-tools /usr/local/bin/rebuild-db \
	&& rm /etc/apache2/sites-enabled/000-default.conf 

COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80

CMD ["/usr/local/bin/httpd-foreground"]