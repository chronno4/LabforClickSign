#!/usr/bin/env sh
set -eu

export SERVER_NAME=${SERVER_NAME}
export URL_RAILS=${URL_RAILS}


envsubst '${SERVER_NAME} ${URL_RAILS}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"
