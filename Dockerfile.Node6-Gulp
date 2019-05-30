FROM t3easy/composer:1-php-7.2

RUN apk --no-cache add rsync

ENV PATH "/tmp/vendor/bin:$PATH"
ENV COMPOSER_HOME /tmp

ENV SURF_VERSION ^2@beta

COPY ssh_config /etc/ssh/ssh_config

RUN composer global require typo3/surf:${SURF_VERSION} \
    && composer clear-cache

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

RUN apk add --no-cache \
            --repository http://dl-cdn.alpinelinux.org/alpine/v3.6/main \
        'nodejs~=6' \
        npm \
        yarn

RUN npm install gulp-cli -g \
    && touch ~/.dummy \
    && npm cache clean --force \
    && rm -f ~/.dummy

CMD ["surf"]
