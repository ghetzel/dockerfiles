XSOCK ?= /tmp/.X11-unix
XAUTH ?= /tmp/.docker.xauth
TAG   ?= registry.apps.gammazeta.net/ghetzel/x11-test
CMD   ?= xterm
EXPORT_ALL_VARIABLES:

all: build


build:
	docker tag $(shell docker build -q .) registry.apps.gammazeta.net/ghetzel/x11-test

run:
	xauth nlist $(DISPLAY) | sed -e 's/^..../ffff/' | xauth -f $(XAUTH) nmerge -
	chmod 755 $(XAUTH)
	docker run --rm -it -v $(XSOCK):$(XSOCK) -v $(XAUTH):$(XAUTH) -e XAUTHORITY=$(XAUTH) -e DISPLAY=$(DISPLAY) registry.apps.gammazeta.net/ghetzel/x11-test $(CMD)
