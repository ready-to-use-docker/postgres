-include configs/settings.env

compose := docker-compose -p $(PROJECT_NAME) -f compose.yaml --env-file ./configs/settings.env

ifneq ($(COMPOSE_EXTRA),)
	compose := $(compose) -f $(COMPOSE_EXTRA)
endif

# Basic commands
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

generate_settings:
	cp configs/settings.env.example configs/settings.env
