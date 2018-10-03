include .env

.PHONY: up down stop prune ps shell logs

default: up

up:
	@echo "Starting up containers for $(PROJECT_NAME)..."
	docker-compose -f traefik.yml pull
	docker-compose -f traefik.yml up -d --remove-orphans

down: stop

stop:
	@echo "Stopping containers for $(PROJECT_NAME)..."
	@docker-compose -f traefik.yml stop

prune:
	@echo "Removing containers for $(PROJECT_NAME)..."
	@docker-compose -f traefik.yml down -v

ps:
	@docker ps --filter name='$(PROJECT_NAME)*'

shell:
	docker exec -ti -e COLUMNS=$(shell tput cols) -e LINES=$(shell tput lines) $(shell docker ps --filter name='$(PROJECT_NAME)' --format "{{ .ID }}") sh

logs:
	@docker-compose -f traefik.yml logs -f $(filter-out $@,$(MAKECMDGOALS))

# https://stackoverflow.com/a/6273809/1826109
%:
	@: