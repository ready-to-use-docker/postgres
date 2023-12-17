-include configs/settings.env

compose := docker-compose -p $(PROJECT_NAME) -f compose.yaml --env-file ./configs/settings.env

ifneq ($(COMPOSE_EXTRA),)
	compose := $(compose) -f $(COMPOSE_EXTRA)
endif

up:
	$(compose) up -d $(args)

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

generate_settings:
	cp configs/settings.env.example configs/settings.env
