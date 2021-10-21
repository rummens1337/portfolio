# Docker commands
docker-run: ./docker-compose.yml
	docker-compose up

docker-build: ./docker-compose.yml
	docker-compose build

docker-full-build: \
	docker-build \
	composer-update \
	composer-install \
	npm-update \
	npm-install

# Composer commands
composer-install: ./vendor
	docker run --rm -v $(shell pwd):/app composer | composer install

composer-update: ./vendor
	docker run --rm -v $(shell pwd):/app composer | composer update

# NPM commands
npm-install: ./node_modules
	docker run --rm -v $(shell pwd):/app node | npm ci

npm-update: ./node_modules
	docker run --rm -v $(shell pwd):/app node | npm update



