#!/bin/bash

python3 manage.py makemigrations

python3 manage.py migrate

python3 manage.py collectstatic --noinput

gunicorn --reload --bind 0.0.0.0:8000 horilla.wsgi:application

