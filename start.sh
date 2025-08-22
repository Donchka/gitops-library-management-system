#!/bin/sh

# Wait for DB to be ready
echo "Waiting for MySQL..."
while ! nc -z $DB_HOST $DB_PORT; do
  sleep 1
done
echo "MySQL is up - running migrations"
python manage.py migrate --noinput

# Start Gunicorn
exec gunicorn library_management_system.wsgi:application --bind 0.0.0.0:8000
