#!/bin/sh
set -e

# Substitute environment variables in nginx.conf.template
envsubst '${BACKEND_PORT},${FRONTEND_PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Execute the default entrypoint script of the nginx image
exec "$@"