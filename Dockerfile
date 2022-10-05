FROM php:7.0.33-fpm-jessie

LABEL maintainer "zhouyueqiu zhouyueqiu@easycorp.ltd"

ENV OS_ARCH="amd64" \
    OS_NAME="debian9" \
    HOME_PAGE="https://modstart.com/"

COPY debian/prebuildfs /

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

ARG IS_CHINA="true"
ENV MIRROR=${IS_CHINA}

RUN install_packages curl wget zip unzip pwgen cron netcat nginx rsync

# Install s6
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "s6" "2.11.1.3" --checksum e713c386993f7891b039256ec264b69240959fb685c75a585bccf63325cc2596

# Install php-ext for modstart
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "php-ext-modstart" "7.0.33" --checksum 645f2945f348467df62d29335897beb4fa752a4283398105099def5cf02457ae

# Install render-template
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "render-template" "1.01" --checksum 8ebb99a7745352b76dc4cf51815dcfbbc3c9ddb9bda1838b8bca5fbf910bf035

# Install mysql-client
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "mysql-client" "5.5" -c db092fc9b2df26d4638e5f4ce4e95c1c4e467643bf659e7f1f2f7a7b19dd5245

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

# RUN mkdir /apps \
#     && cd /apps \
#     && curl -skL -o modstartcms.zip https://github.com/modstart/ModStartCMS/archive/refs/heads/master.zip \
#     && unzip modstartcms.zip \
#     && mv ModStartCMS-master modstartcms \
#     && rm -rf modstartcms.zip \
#     && rm -f /etc/nginx/sites-enabled/*

# Copy modstart config files
COPY debian/rootfs /

# Copy modstart source code
WORKDIR /apps/modstartcms
RUN chown www-data.www-data /apps/modstartcms -R

EXPOSE 80

# Persistence directory
VOLUME [ "/data"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
