build-app:
	pushd compose && \
	docker-compose build app && \
	popd
	
up-app:
	pushd compose && \
	docker-compose -f docker-compose.yml up -d app && \
	popd