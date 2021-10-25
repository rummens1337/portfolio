# Environment variables (could also be imported from an external env file).
NODE_VERSION=lts-buster-slim
COMPOSER_VERSION=2.1.9

# Docker commands
docker-run: ./docker-compose.yml
	docker-compose up

docker-build: ./docker-compose.yml
	docker-compose build

docker-full-build: \
	docker-build \
	composer-install \
	npm-install



# Composer commands
composer-install: ./vendor
	sudo -S docker run --rm -v $(shell pwd):/app composer:$(COMPOSER_VERSION) install

composer-update: ./vendor
	sudo -S docker run --rm -v $(shell pwd):/app composer:$(COMPOSER_VERSION) update

composer: ./vendor # Run with arg=<command>
	sudo -S docker run --rm -v $(shell pwd):/app composer:$(COMPOSER_VERSION) $(arg)



# NPM commands
npm-install:
	sudo -S docker run --rm -v $(shell pwd):/app -w /app node:$(NODE_VERSION) npm install --loglevel=verbose

npm-update:
	sudo -S docker run --rm -v $(shell pwd):/app -w /app node:$(NODE_VERSION) npm update --loglevel=verbose

npm: # Run with arg=<command>
	sudo -S docker run --rm -v $(shell pwd):/app -w /app node:$(NODE_VERSION) npm $(arg) --loglevel=verbose



