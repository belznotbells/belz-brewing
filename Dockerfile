FROM registry.access.redhat.com/ubi9/httpd-24

LABEL maintainer="Belznotbells"
LABEL description="Container for running taplist"

COPY index.html /var/www/html/index.html

# Disable SSL config to avoid missing certificate errors
RUN mv /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.conf.disabled

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
