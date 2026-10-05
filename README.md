# docker-django
A dockerfile to run django

## Why
The [official docker image for django](https://hub.docker.com/_/django/) is deprecated since 31 Dec 2016. Even that did not seem development friendly, since it generated images with a copied version of the project instead of a mounted project folder.

## How to install

1. Install docker ;-)

2. Clone the repository:
```shell
https://github.com/malcata/docker-django.git
```

## Create a new project (only once per project)

To start a new project, use django-admin to create a project named hello_world.

```shell
$ docker compose run django django-admin startproject hello_world .
```

## Usage

To Launch Django with docker compose:

```shell
$ docker compose up
```

Use a browser to access django http://localhost:8000



## Configure the DB /Load Migrations

To run the database migrations:

```shell
$ docker compose run django /code/manage.py migrate
```


## Contributing

Please follow the Github flow process (branch, commits and pull request)...

## License

The code in this repository, unless otherwise noted, is MIT licensed. See the ['LICENSE'](LICENSE) file in this repository.
