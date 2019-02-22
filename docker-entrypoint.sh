#!/bin/bash

isCommand() {
  for cmd in \
    "deploy" \
    "describe" \
    "help" \
    "list" \
    "migrate" \
    "rollback" \
    "show" \
    "simulate"
  do
    if [ -z "${cmd#"$1"}" ]; then
      return 0
    fi
  done

  return 1
}

# check if the first argument passed in looks like a flag
if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- surf "$@"
# check if the first argument passed in is surf
elif [ "$1" = 'surf' ]; then
  set -- /sbin/tini -- "$@"
# check if the first argument passed in matches a known command
elif isCommand "$1"; then
  set -- /sbin/tini -- surf "$@"
fi

exec "$@"
