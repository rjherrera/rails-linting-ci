PROJECT ?= rails-linting-ci
DOCKER_COMPOSE_FILE ?= docker-compose.yml

DOCKER_COMPOSE_ARGS ?= -p $(PROJECT) -f $(DOCKER_COMPOSE_FILE)

SHELL := /bin/bash

run: help

BOLD ?= $(shell tput bold)
NORMAL ?= $(shell tput sgr0)

help:
	@echo Install dependencies:
	@echo "  ${BOLD}make setup${NORMAL}"
	@echo ""
	@echo Runing the services like mysql:
	@echo "  ${BOLD}make services-up${NORMAL}"
	@echo ""
	@echo "Reset the environment (rm mysql db):"
	@echo "  ${BOLD}make services-down${NORMAL}"
	@echo ""

setup:
	bin/setup

services: services-up

services-ps:
	docker-compose $(DOCKER_COMPOSE_ARGS) ps

services-up:
	docker-compose $(DOCKER_COMPOSE_ARGS) up -d

services-stop:
	docker-compose $(DOCKER_COMPOSE_ARGS) stop

services-down:
	docker-compose $(DOCKER_COMPOSE_ARGS) down --volumes

services-logs:
	docker-compose $(DOCKER_COMPOSE_ARGS) logs -f

services-port:
	@set -o pipefail; \
	docker-compose $(DOCKER_COMPOSE_ARGS) port ${SERVICE} ${PORT} 2> /dev/null | cut -d':' -f2 || echo ${PORT}

backup-staging: ROLE=staging
backup-production: ROLE=production
backup-%:
	@echo Capturing $(ROLE)....
	@heroku pg:backups:capture --remote $(ROLE)

restore-from-staging: ROLE=staging
restore-from-production: ROLE=production
restore-from-%:
	$(eval TEMP_FILE=$(shell mktemp))
	@echo Restoring from $(ROLE)....
	@heroku pg:backups:download --remote $(ROLE) --output $(TEMP_FILE)
	@pg_restore --verbose --clean --no-acl --no-owner -h localhost \
		-U postgres -p $(shell make services-port SERVICE=postgresql PORT=5432) -d $(PROJECT)_development $(TEMP_FILE)
