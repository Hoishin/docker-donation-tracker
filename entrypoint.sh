#!/bin/sh

set -eu

python manage.py check --deploy
python manage.py collectstatic
python manage.py migrate
gunicorn --bind=0.0.0.0:${PORT} --workers=${WORKERS} wsgi
