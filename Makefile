export IMAGE_NAME?=malcata/django
export CONTAINER_NAME?=django
export SOURCE_DIR?=~/source/project
export WORK_DIR?=/usr/src/app
export PROJECT_NAME?=newproject
export DJANGO_SECRET_KEY?=pleasereplacethis

build:
	docker build -t ${IMAGE_NAME} -f Dockerfile .

# first time if there is no django project yet
startproject:
	docker run -it --rm --user "$(id -u):$(id -g)"  --volume ${SOURCE_DIR}:${WORK_DIR} --workdir ${WORK_DIR} \
	    ${IMAGE_NAME} bash -c "django-admin.py startproject ${PROJECT_NAME} && mv ${PROJECT_NAME} lixo && mv lixo/* . && rmdir lixo"
run:
	docker run -it --rm --volume ${SOURCE_DIR}:${WORK_DIR} --workdir ${WORK_DIR} ${IMAGE_NAME} \
	    bash -c 'sed -i -e "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \['\''localhost'\''\]/; s/SECRET_KEY = '\''.*'\''/SECRET_KEY = os.environ\[\"DJANGO_SECRET_KEY\"\]/" `find . -name settings.py`'
	docker run --name ${CONTAINER_NAME} \
	--volume ${SOURCE_DIR}:${WORK_DIR} \
	--workdir ${WORK_DIR} \
	--env DJANGO_SECRET_KEY="${DJANGO_SECRET_KEY}" \
	--publish 127.0.0.1:8000:8000 \
	--detach ${IMAGE_NAME} 

# for easier debug
runit:
	docker run -it --rm --volume ${SOURCE_DIR}:${WORK_DIR} --workdir ${WORK_DIR} ${IMAGE_NAME} \
	    bash -c 'sed -i -e "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \['\''localhost'\''\]/; s/SECRET_KEY = '\''.*'\''/SECRET_KEY = os.environ\[\"DJANGO_SECRET_KEY\"\]/" `find . -name settings.py`'
	docker run -it --rm --volume ${SOURCE_DIR}:${WORK_DIR} \
	--workdir ${WORK_DIR} \
	--env DJANGO_SECRET_KEY="${DJANGO_SECRET_KEY}" \
	--publish 127.0.0.1:8000:8000 ${IMAGE_NAME} bash

rmi:
	docker rmi -f $(IMAGE_NAME)

clean:
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)
	-docker rmi $(IMAGE_NAME)
	-docker rmi python

