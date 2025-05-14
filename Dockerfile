# Use a Red Hat UBI-based Apache image that's OpenShift compatible
FROM registry.access.redhat.com/ubi9/httpd-24

# Labels (optional but good practice)
LABEL maintainer="belznotbells"
LABEL description="OpenShift-ready Apache HTTPD container"

# ADD index.html /var/www/html/index.html

# Run Apache in the foreground
CMD run-httpd

