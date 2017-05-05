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
3. Configure required environment variables, eventually on a bash_profile file:
```shell
$ export SOURCE_DIR="<project source folder>"
```

## Usage

1. Generate the docker image
```shell
$ make build
```
2. Add to the environment the following variables (.bash_profile or .bashrc):
```shell
export SOURCE_DIR?=~/source/project
# ONLY NEEDED FOR NEW PROJECTS
export PROJECT_NAME?=newproject
export DJANGO_SECRET_KEY?=pleasereplacethis
```

3. (optional) First time to create the django project
```shell
$ make startproject
```
4. Run the container
```shell
$ make run
```
5. Use browser to access django http://localhost:8000

Check the [Makefile](Makefile) for further details.


## Contributing

Please follow the Github flow process (branch, commits and pull request)...


## License

The code in this repository, unless otherwise noted, is MIT licensed. See the ['LICENSE'](LICENSE) file in this repository.


