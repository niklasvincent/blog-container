all:
	python caddy/generate.py
	docker build -t nlindblad/blog .
push:
	docker push nlindblad/blog

travis:
	pip install --user -r caddy/requirements.txt
	docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
	python caddy/generate.py
	docker build -t nlindblad/blog .
	docker push nlindblad/blog
