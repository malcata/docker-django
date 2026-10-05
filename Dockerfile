# Dev decision to use slim. Could instead lock a python version e.g. :3.6, :2.7
FROM python:slim

LABEL org.opencontainers.image.authors="https://github.com/malcata"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

## Install all db options, minimal footprint
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc \
        gettext \
        python3-dev \
        postgresql-client libpq-dev \
        sqlite3 \
    && rm -rf /var/lib/apt/lists/*

## Install Django
WORKDIR /code
COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt    

EXPOSE 8000
CMD ["python","manage.py", "runserver", "0.0.0.0:8000"]