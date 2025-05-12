# Use a Red Hat UBI-based Apache image that's OpenShift compatible
FROM registry.access.redhat.com/ubi9/httpd-24

# Labels (optional but good practice)
LABEL maintainer="belznotbells"
LABEL description="OpenShift-ready Apache HTTPD container"

# Copy your static site content
COPY index.html /var/www/html/index.html

RUN sed -ri -e "/^Listen 80/c\Listen ${PORT}" /etc/httpd/conf/httpd.conf && \
chown -R apache:apache /etc/httpd/logs/ && \
chown -R apache:apache /run/httpd/

USER apache

# Expose port 80 for OpenShift router to connect
EXPOSE 80

# Run Apache in the foreground
CMD ["httpd", "-D", "FOREGROUND"]

