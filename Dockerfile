FROM php:7.0-cli

RUN apt-get update && apt-get install -y \
		git \
		openssh-client \
		rsync \
	--no-install-recommends && rm -r /var/lib/apt/lists/*

ENV SURF_VERSION 2.0.0-beta6

RUN curl -L https://github.com/TYPO3/Surf/releases/download/$SURF_VERSION/surf.phar -o /usr/local/bin/surf \
    && chmod a+x /usr/local/bin/surf

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["--help"]