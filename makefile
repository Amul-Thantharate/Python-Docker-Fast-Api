# Used by `image`, `push` & `deploy` targets, override as required
IMAGE_REG ?= docker.io
IMAGE_REPO ?= amuldark/python-fast-api
IMAGE_TAG ?= latest



# Used by `test-api` target
TEST_HOST ?= localhost:5000

# Don't change
SRC_DIR := src
TEST_DIR := tests

.PHONY: help lint lint-fix image push run deploy undeploy test test-report test-api clean .EXPORT_ALL_VARIABLES
.DEFAULT_GOAL := help

help: ## 💬 This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


image: ## 🔨 Build container image from Dockerfile 
	docker build . --file build/Dockerfile \
	--tag $(IMAGE_REG)/$(IMAGE_REPO):$(IMAGE_TAG)

push: ## 📤 Push container image to registry 
	docker push $(IMAGE_REG)/$(IMAGE_REPO):$(IMAGE_TAG)
