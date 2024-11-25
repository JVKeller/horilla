#!/bin/bash

# Make migrations
python3 manage.py makemigrations && \

# Apply migrations
python3 manage.py migrate && \

# Collect static files without user input
python3 manage.py collectstatic --noinput && \