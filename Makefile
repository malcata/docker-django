export IMAGE_NAME?=malcata/django
export CONTAINER_NAME?=django
export SOURCE_DIR?=~/source/project
export WORK_DIR?=/usr/src/app

build:
	docker build -t ${IMAGE_NAME} -f Dockerfile .

run:
	docker run --name ${CONTAINER_NAME} \
	--volume ${SOURCE_DIR}:${WORK_DIR} \
	--workdir ${WORK_DIR} \
	--publish 8000:8000 \
	--detach ${IMAGE_NAME} 

rmi:
	docker rmi -f $(IMAGE_NAME)

clean:
	-docker rm -v $$(docker ps -a -q -f status=exited)
	-docker rmi $$(docker images -q -f dangling=true)
	-docker rmi $(IMAGE_NAME)
	-docker rmi python

