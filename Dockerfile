# Use a Red Hat UBI-based Apache image that's OpenShift compatible
FROM registry.access.redhat.com/ubi9/httpd-24

# Labels (optional but good practice)
LABEL maintainer="belznotbells"
LABEL description="OpenShift-ready Apache HTTPD container"

# Add your static site content
USER 0
ADD index.html /var/www/html/index.html
RUN chown -R 1001:0 /var/www/html
USER 1001

# Run Apache in the foreground
CMD run-httpd

