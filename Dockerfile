ARG ALPINE_VERSION=3.12
ARG COMPOSER_VERSION=2
ARG NODE_VERSION=14
ARG PHP_VERSION=7.4
ARG SURF_VERSION=2

FROM node:${NODE_VERSION}-alpine as node
RUN rm /usr/local/bin/docker-entrypoint.sh

FROM t3easy/composer:${COMPOSER_VERSION}-php${PHP_VERSION}-alpine${ALPINE_VERSION}
ARG SURF_VERSION

LABEL org.opencontainers.image.source="https://github.com/t3easy/docker-surf"

ENV SURF_VERSION=^${SURF_VERSION}

ENV PATH "/usr/local/share/.config/yarn/global/node_modules/.bin:$PATH"
ENV COMPOSER_CACHE_DIR /tmp/cache/composer
ENV YARN_CACHE_FOLDER /tmp/cache/yarn
ENV npm_config_cache /tmp/cache/npm

RUN set -eux; \
    apk --no-cache add \
      libstdc++ \
      rsync \
    ; \
    \
    composer --version; \
    composer global require typo3/surf:${SURF_VERSION}; \
    rm -rf ${COMPOSER_CACHE_DIR}

COPY --from=node /opt /opt
COPY --from=node /usr/local/bin /usr/local/bin
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/share /usr/local/share

RUN set -eux; \
    surf --version; \
    php --version; \
    node --version; \
    npm --version; \
    yarn --version

RUN set -eux; \
    yarn global add gulp-cli; \
    rm -rf ${YARN_CACHE_FOLDER}; \
    gulp --version

# Configure ssh client
COPY ssh_config /etc/ssh/ssh_config

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["surf"]
