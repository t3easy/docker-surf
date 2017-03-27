FROM composer

RUN apk --no-cache add rsync

ENV SURF_VERSION 2.0.0-beta7

RUN composer global config minimum-stability beta \
    && composer global require typo3/surf:${SURF_VERSION}

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

RUN apk --no-cache add 'nodejs<7.0.0'

RUN npm install gulp-cli -g \
    && touch ~/.dummy \
    && npm cache clean \
    && rm -f ~/.dummy

CMD ["surf"]