all:
	python caddy/generate.py
	docker build -t nlindblad/blog .
push:
	docker push nlindblad/blog

travis:
	pip install --user -r caddy/requirements.txt
	python caddy/generate.py
	docker build -t nlindblad/blog .
