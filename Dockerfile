FROM t3easy/composer:1-php-7.2

ENV SURF_VERSION dev-master

ENV PATH "/usr/local/yarn/bin:/usr/local/share/.config/yarn/global/node_modules/.bin:$PATH"
ENV COMPOSER_CACHE_DIR /tmp/cache/composer
ENV YARN_CACHE_FOLDER /tmp/cache/yarn
ENV npm_config_cache /tmp/cache/npm

# Install TYPO3 Surf
RUN composer global require typo3/surf:${SURF_VERSION} && \
    composer clear-cache

# Install build tools
RUN apk --no-cache add \
        gnupg \
        nodejs \
        npm \
        rsync \
        && \
    curl -o- -L https://yarnpkg.com/install.sh | bash && \
    mv /root/.yarn /usr/local/yarn && \
    touch /.yarnrc && \
    chmod 666 /.yarnrc && \
    apk del gnupg

RUN yarn global add gulp-cli && yarn cache clean

# Configure ssh client
COPY ssh_config /etc/ssh/ssh_config

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["surf"]
