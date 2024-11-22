#!/bin/bash

# Make migrations
python3 manage.py makemigrations && \

# Apply migrations
python3 manage.py migrate && \

# Collect static files without user input
python3 manage.py collectstatic --noinput && \

# Start the Gunicorn server
gunicorn --reload --bind 0.0.0.0:8000 horilla.wsgi:application