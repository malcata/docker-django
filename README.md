# docker-django
A dockerfile to run django

## Why
The [official docker image for django](https://hub.docker.com/_/django/) is deprecated since 31 Dec 2016. Even that did not seem development friendly, since it generated images with a copied version of the project instead of a mounted project folder.

## How to install

1. Install docker ;-)
2. Clone repository:
```shell
https://github.com/malcata/docker-django.git
```

## Create a new project (only once per project)

2. Start a new project
```shell
$ docker compose run web django-admin startproject hello_world .
```

## Configure the DB /Load Migrations

3. Import / Update the Database
```shell
$ docker compose run web /code/manage.py migrate
```

## Usage

4. Run the container
```shell
$ docker compose up
```

5. Use browser to access django http://localhost:8000


## Contributing

Please follow the Github flow process (branch, commits and pull request)...

## License

The code in this repository, unless otherwise noted, is MIT licensed. See the ['LICENSE'](LICENSE) file in this repository.


