GIT_DIR = ../..

class-linux: Dockerfile
	cd ${GIT_DIR}/$@/docker; docker build . -t $@

clean:
	docker image rm ${TARGET}