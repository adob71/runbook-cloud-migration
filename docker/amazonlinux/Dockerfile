FROM amazonlinux:latest
RUN yum install -y unzip tar httpd php net-tools lynx procps
COPY runbook-expert.tar.gz /var/www/runbook-expert.tar.gz
RUN gunzip /var/www/runbook-expert.tar.gz && tar -xvf /var/www/runbook-expert.tar --directory /var/www && chown -R apache /var/www/runbook-expert && chgrp -R apache /var/www/runbook-expert && rm -rf /var/www/html && mv /var/www/runbook-expert /var/www/html
COPY httpd-foreground /usr/local/bin/
CMD ["httpd-foreground"]
EXPOSE 80
