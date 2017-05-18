FROM composer

RUN apk --no-cache add rsync

ENV SURF_VERSION 2.0.0-beta7

RUN composer global config minimum-stability beta \
    && composer global require typo3/surf:${SURF_VERSION} \
    && composer clear-cache

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["surf"]