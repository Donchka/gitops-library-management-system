FROM python:3.13-slim
WORKDIR /app
RUN apt-get update && apt-get install -y \
    pkg-config \
    default-libmysqlclient-dev \
    build-essential \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn whitenoise
COPY . .
RUN python manage.py collectstatic --noinput
EXPOSE 8000
RUN chmod +x start.sh
ENTRYPOINT ["/app/start.sh"]
