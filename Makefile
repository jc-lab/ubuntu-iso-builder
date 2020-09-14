TEMP_DOCKER_IMAGE=temp-ubuntu_iso_builder

PWD := $(shell pwd)
SUDO := sudo

PHONY: build

build:
	${SUDO} docker build --tag=${TEMP_DOCKER_IMAGE} .

out/output.iso:
	mkdir -p ${PWD}/out
	${SUDO} docker run --rm -v ${PWD}/out:/mnt/out -it ${TEMP_DOCKER_IMAGE} cp /work/output.iso /mnt/out/

all: build out/output.iso
