include .env
PROJECT_NAME:=stencil

.PHONY: deploy

build-nginx:
	$(eval IMAGE_NAME="ghcr.io/oleksandrtimoshenko/${PROJECT_NAME}.stencil:latest")
	echo ${PAT} | docker login ghcr.io -u ${GITHUB_USER} --password-stdin;
	docker build -t ${IMAGE_NAME} service
	docker push ${IMAGE_NAME}