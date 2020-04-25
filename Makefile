DOCKERFILES   ?= $(shell ls -1 */Dockerfile*)
REGISTRY      ?= registry.apps.gammazeta.net/
XSOCK         ?= /tmp/.X11-unix
XAUTH         ?= /tmp/.docker.xauth
X11_CONTAINER ?= $(REGISTRY)ghetzel/qt:latest
CMD           ?= /bin/bash
TAGNAME        = $(or $(subst .,,$(suffix $(@))),latest)

.EXPORT_ALL_VARIABLES:
.PHONY: all $(DOCKERFILES)

all: $(DOCKERFILES)

$(DOCKERFILES):
	@echo "Building $(@D):$(TAGNAME)"
	cd $(@D) && docker build --no-cache --file $(notdir $(@)) --tag $(REGISTRY)ghetzel/$(@D):$(TAGNAME) .

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
