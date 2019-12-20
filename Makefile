CONTAINERS    ?= $(dir $(shell ls -1 */Dockerfile))
REGISTRY      ?= registry.apps.gammazeta.net/
XSOCK         ?= /tmp/.X11-unix
XAUTH         ?= /tmp/.docker.xauth
X11_CONTAINER ?= $(REGISTRY)ghetzel/qt:latest
CMD           ?= /bin/bash

.EXPORT_ALL_VARIABLES:
.PHONY: all $(CONTAINERS)

all: $(CONTAINERS)

$(CONTAINERS):
	@echo "Building $(@D)"
	cd $(@D) && docker build -t $(REGISTRY)ghetzel/$(@D):latest .

run-x11:
	xauth nlist $(DISPLAY) | sed -e 's/^..../ffff/' | xauth -f $(XAUTH) nmerge -
	chmod 755 $(XAUTH)
	docker run \
		--rm \
		--interactive \
		--tty \
		--volume $(XSOCK):$(XSOCK) \
		--volume $(XAUTH):$(XAUTH) \
		--volume $(shell which hydra):/usr/bin/hydra \
		--env XAUTHORITY=$(XAUTH) \
		--env DISPLAY=$(DISPLAY) \
		$(X11_CONTAINER) $(CMD)
