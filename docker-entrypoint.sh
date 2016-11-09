#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- surf "$@"
fi

# if our command is a valid surf subcommand, let's invoke it through surf instead
# (this allows for "docker run t3easy/surf list", etc)
if surf "$1" --help > /dev/null 2>&1; then
	set -- surf "$@"
fi

exec "$@"
