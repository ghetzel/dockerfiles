TAG   ?= latest
IMAGE ?= ghcr.io/ghetzel/fudforum:$(TAG)

all: build

build:
	@docker build -t ghcr.io/ghetzel/fudforum:latest .

push:
	@docker push $(IMAGE)
