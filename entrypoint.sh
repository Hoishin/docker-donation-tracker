#!/bin/sh

set -eu

python manage.py collectstatic --clear --no-input > /dev/null
python manage.py migrate > /dev/null
gunicorn --bind=0.0.0.0:${PORT} --workers=${WORKERS} wsgi
