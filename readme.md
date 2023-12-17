# Postgres Docker

## Requirements:

* make
* docker
* docker-compose

## How to use 

Before starting, you need to configure the settings file using the command:

```shell
$ make generate_settings
```

In the `configs` directory, the `settings.env` file will appear. Use it to manage the project settings.

After that, to start use the command:

```shell
$ make up
```
