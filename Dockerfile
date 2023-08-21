FROM hub.qucheng.com/base/modstartcms:php7.0.33-fpm-jessie

# Install modstart
ARG VERSION
ENV APP_VER=${VERSION}
ENV EASYSOFT_APP_NAME="ModStart $APP_VER"

RUN mkdir /apps \
    && cd /apps \
    && curl -skL -o modstartcms.tar.gz https://github.com/modstart/ModStartCMS/archive/refs/tags/${APP_VER}.tar.gz \
    && tar xvzf modstartcms.tar.gz \
    && mv ModStartCMS-${VERSION} modstartcms \
    && rm -rf modstartcms.tar.gz \
    && rm -f /etc/nginx/sites-enabled/*

COPY debian/rootfs /

# Copy modstart source code
WORKDIR /apps/modstartcms
RUN chown www-data.www-data /apps/modstartcms -R

EXPOSE 80

# Persistence directory
VOLUME [ "/data"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
