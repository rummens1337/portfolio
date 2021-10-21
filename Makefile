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
	docker run --rm -v $(shell pwd):/app composer | composer install

composer-update: ./vendor
	docker run --rm -v $(shell pwd):/app composer | composer update

composer: ./vendor
	docker run --rm -v $(shell pwd):/app composer | composer $(arg)



# NPM commands
npm-install: ./node_modules
	docker run --rm -v $(shell pwd):/app node | npm ci

npm-update: ./node_modules
	docker run --rm -v $(shell pwd):/app node | npm update

npm: ./vendor
	docker run --rm -v $(shell pwd):/app node | npm $(arg)



