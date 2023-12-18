-include configs/settings.env

compose := docker-compose -p $(PROJECT_NAME) -f compose.yaml --env-file ./configs/settings.env

ifneq ($(COMPOSE_EXTRA),)
	compose := $(compose) -f $(COMPOSE_EXTRA)
endif

ids := $(shell $(compose) ps -aq)
check_number := $(if $(n),$(PROJECT_NAME)-postgres-$(n),$(ids))

# Basic commands
generate_settings:
	cp configs/settings.env.example configs/settings.env

cp:
	$(compose) cp $(args)

create:
	$(compose) create $(args)

down:
	$(compose) down $(args)

up:
	$(compose) up $(args)

logs:
	$(compose) logs -f $(args)

ps:
	$(compose) ps $(args)

restart:
	$(compose) restart $(args)

start:
	$(compose) start $(args)

stop:
	$(compose) stop $(args)

top:
	$(compose) top $(args)

# Advanced commands
upd:
	$(compose) up -d $(args)

inspect:
	docker inspect -s $(check_number) | jq

inspect_id:
	docker inspect -f='{{json .Id}}' $(check_number) | jq

inspect_args:
	docker inspect -f='{{json .Args}}' $(check_number) | jq

inspect_state:
	docker inspect -f='{{json .State}}' $(check_number) | jq

inspect_mounts:
	docker inspect -f='{{json .Mounts}}' $(check_number) | jq

inspect_config:
	docker inspect -f='{{json .Config}}' $(check_number) | jq

inspect_network_settings:
	docker inspect -f='{{json .NetworkSettings}}' $(check_number) | jq
