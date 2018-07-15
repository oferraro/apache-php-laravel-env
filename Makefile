include conf/.env
WEB_ID=lamp1-http
WEB_IMG_ID=lamp1-web
MYSQL_ID=lamp1-mysql
MYSQL_IMG_ID=lamp1-mariadb
VOLUME_DB=lamp1-db

build: ##@ Build the images
	docker-compose build

build-nc: ##@ Build the images not using cache MG_SECURE_URL= MG_SECURE_URL= MG_MODE= 
	docker-compose build --no-cache

up: ##@ Start the images
	docker-compose up 

upd: ##@ Start the images (daemon mode)
	docker-compose up -d

stop: ##@ Stop image
	docker-compose stop

delete: ##@ Delete apache-laravel images, containers and volumes
	@chmod u+x ./delete-images.sh
	@exec ./delete-images.sh $(WEB_ID) $(WEB_IMG_ID) $(MYSQL_ID) $(MYSQL_IMG_ID) $(VOLUME_DB)

logs: ##@ show logs (tail)
	docker logs -t $(WEB_ID)

logsf: ##@ show logs in real time
	docker logs -f -t $(WEB_ID)

ps: ##@ Show docker processes
	docker ps

login_bash: ##@ Log into the machine
	docker exec -it $(WEB_ID) bash

rebuild_db_and_conf: ##@ Set permissions, Install dev tools and rebuild db
	@echo Reinstall the DB and config the environment in $(WEB_ID)
	docker exec $(WEB_ID) /usr/local/bin/set-permissions
	docker exec $(WEB_ID) /usr/local/bin/install-dev-tools
	docker exec $(WEB_ID) /usr/local/bin/rebuild-db

.DEFAULT_GOAL := help

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##@.*$$)' $(MAKEFILE_LIST) \
		| sed s/makefile://i \
		| awk 'BEGIN { FS = ":" }; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' \
		| sed s/##@/==\>/ \
		| sed -e 's/\[32m##/[33m/'
