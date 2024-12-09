#!/bin/bash
# Update package list
echo "Updating package list..."
apt update

# Install NTP
echo "Installing NTP..."
apt install -y ntp
apt install -y nano

# Set the timezone to New York
echo "Setting timezone to New York..."
timedatectl set-timezone America/New_York

# Restart NTP service to apply changes
echo "Restarting NTP service..."
systemctl restart ntp

echo "NTP installation and timezone configuration completed."

echo "Waiting for database to be ready..."

python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py collectstatic --noinput
python3 manage.py createhorillauser --first_name admin --last_name admin --username admin --password admin --email admin@example.com --phone 1234567890
gunicorn --bind 0.0.0.0:8080 horilla.wsgi:application
