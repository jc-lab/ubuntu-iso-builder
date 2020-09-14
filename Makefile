TEMP_DOCKER_IMAGE=temp-ubuntu_iso_builder

PWD := $(shell pwd)
SUDO := sudo

PHONY: iso-build

iso-build:
	mkdir -p iso-builder/build/
	cp mirror.txt iso-builder/build/
	${SUDO} docker build --tag=${TEMP_DOCKER_IMAGE} iso-builder/

out/output.iso: iso-build
	mkdir -p ${PWD}/out
	${SUDO} docker run --rm -v ${PWD}/out:/mnt/out -it ${TEMP_DOCKER_IMAGE} cp /work/output.iso /mnt/out/

all: out/output.iso

