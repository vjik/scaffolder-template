.DEFAULT_GOAL := help

IMAGE_NAME := _____/_____

build: ## Build the docker image
	docker build -t $(IMAGE_NAME) .

run: ## Run tool via docker
	docker run \
      --volume .:/project \
      --user $(shell id -u):$(shell id -g) \
      --interactive --tty --rm --init \
      $(IMAGE_NAME):latest \
      $(RUN_ARGS)

# Output the help for each task, see https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
