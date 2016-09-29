all:
	python caddy/generate.py
	docker build -t nlindblad/blog .
push:
	docker push nlindblad/blog
