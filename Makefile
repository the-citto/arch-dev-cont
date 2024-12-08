

IMAGE-NAME = arch-dev


run-dev:
	podman run \
		-ti \
		--rm \
		$(IMAGE-NAME) \
		sh -i -c "bash"


build-dev:
	podman build --tag $(IMAGE-NAME) --build-arg user=$(USER) .


prune:
	podman system prune

prune-all:
	podman system prune -a



foo:
	echo $(USER)
