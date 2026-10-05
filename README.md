# docker-django
A dockerfile to run django

## Why
The [official docker image for django](https://hub.docker.com/_/django/) is deprecated since 31 Dec 2016. Even that did not seem development friendly, since it generated images with a copied version of the project instead of a mounted project folder.

## How to install

1. Install docker

2. Clone the repository  ;-) 
```shell
git clone https://github.com/malcata/docker-django.git
```

## Create a new project (only once)

To start a new project, use django-admin to create a project named experiment.

```shell
$ docker compose run django django-admin startproject experiment .
```

## Usage / Launch Django

To Launch Django with docker compose in daemon mode:

```shell
$ docker compose up -d
```

Use a browser to access django http://localhost:8000


## Create a new app (one per app)

To start a new app, use manage.py to create an app named hello_world.

```shell
$ docker compose run django /code/manage.py startapp hello_world
```

## Configure the DB /Load Migrations

To run the database migrations:

```shell
$ docker compose run django /code/manage.py migrate
```

## Create an admin user

```shell
$ docker compose run django /code/manage.py createsuperuser
```

## Stop Django

To stop Django with docker compose:

```shell
$ docker compose down
```


## Contributing

Please follow the Github flow process (branch, commits and pull request)...

## License

The code in this repository, unless otherwise noted, is MIT licensed. See the ['LICENSE'](LICENSE) file in this repository.
