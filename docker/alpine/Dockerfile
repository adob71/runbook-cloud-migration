FROM alpine:latest
RUN apk add unzip tar apache2 php php7-apache2 bash libc6-compat net-tools lynx procps sed
COPY runbook-expert.tar.gz /var/www/localhost/runbook-expert.tar.gz
RUN tar -zxvf /var/www/localhost/runbook-expert.tar.gz --directory /var/www/localhost \
 && chown -R apache /var/www/localhost/runbook-expert \
 && chgrp -R apache /var/www/localhost/runbook-expert \
 && rm -rf /var/www/localhost/htdocs \
 && mv /var/www/localhost/runbook-expert /var/www/localhost/htdocs
COPY httpd-foreground /usr/local/bin/
CMD ["httpd-foreground"]
EXPOSE 80
