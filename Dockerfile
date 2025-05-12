# Use a Red Hat UBI-based Apache image that's OpenShift compatible
FROM registry.access.redhat.com/ubi9/httpd-24

# Labels (optional but good practice)
LABEL maintainer="belznotbells"
LABEL description="OpenShift-ready Apache HTTPD container"

# Copy your static site content
COPY index.html /var/www/html/index.html

# Disable default SSL config to avoid missing cert errors
RUN mv /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.conf.disabled

# Tell Apache to listen on port 8080 (OpenShift default)
RUN sed -i 's/^Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf \
    && echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf

# Expose port 8080 for OpenShift router to connect
EXPOSE 8080

# Ensure permissions for OpenShift's random UID strategy
RUN chown -R 1001:0 /var/www/html && chmod -R g+rwX /var/www/html && \
    chown -R 1001:0 /etc/httpd && chmod -R g+rwX /etc/httpd

# Run Apache in the foreground
USER 1001
CMD ["httpd", "-D", "FOREGROUND"]

