# Dev decision to use latest. Could instead lock a python version e.g. :3.6, :2.7
FROM python:latest

MAINTAINER Malcata https://github.com/malcata

## Install Django
RUN pip install --no-cache-dir Django psycopg2 mysqlclient

## Install all db options, minimal footprint
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc \
        gettext \
        mysql-client libmysqlclient-dev \
        postgresql-client libpq-dev \
        sqlite3 \
    && rm -rf /var/lib/apt/lists/*
        

### Eventual TEST Environment
## At build time copy everything directly from the continuous integration
#RUN mkdir -p /usr/src/app
#WORKDIR /usr/src/app
#COPY requirements.txt ./
#RUN pip install --no-cache-dir -r requirements.txt
#COPY . .

### DEV ENVIRONMENT
## At run time mount the code folder

EXPOSE 8000
CMD ["python","manage.py", "runserver", "0.0.0.0:8000"]
