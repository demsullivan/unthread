# unthread
Prototype of a neurodivergent-friendly chat app

## Setting up for development

### Requirements

- Docker

### Getting started

Simply build the image and bring the services up:

```shell
docker compose build app
docker compose up
```

### Accessing a container shell

```shell
docker compose run app /bin/bash --login
```