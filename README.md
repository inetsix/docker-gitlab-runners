# Docker Compose for gitlab-ci runners

Repository to deploy a stack of 4 gitlab runners. Runners are configured to run any docker containers as CI environment (docker-executor) and `docker in docker` (dind) as well to build docker image

## Usage

Update file [`env.runners`](env.runners) to add your token:

```shell
$ cat env.runners
GIT_SERVER="https://www.gitlab.com"
TOKEN_REGISTRATION="PUT YOUR GITLAB TOKEN HERE"
TAGS="docker,ansible"
```

You can also change `tags` and gitlab server accordingly

### Short path to runners UP

```shell
# Build topology, start and register
$ make build

# Get docker status
$ make ps

# Delete topology
$make down
```

### Available commands

- __Build and register runners__

```shell
$ make build
```

- __List runners status__

```shell
$ make unregister
```

- __Stop runners__

```shell
$ make stop
```

- __Start runners__

```shell
$ make start
```

- __Delete runners__

```shell
$ make down
```

- __Register runners__

```shell
$ make register
```

- __Unregister runners__

```shell
$ make unregister
```

## Misc

### Install docker compose:

* Run this command to download the latest version of Docker Compose:

```shell
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m)\
          -o /usr/local/bin/docker-compose
```

* Apply executable permissions to the binary:

```shell
sudo chmod +x /usr/local/bin/docker-compose
```

* Test the installation.

```shell
$ docker-compose --version
docker-compose version 1.21.2, build 1719ceb
```

### Start topology

In the repository:

```shell
docker-compose up -d --build
```

### Upgrade images:

```shell
docker-compose stop
for image in `cat docker-compose.yml | grep image | awk -F ": " '{print $2}'`; do
docker pull $image
done
docker-compose up -d --build
```

### Debug

- Add DOCKER-ISOLATION in iptables:

```shell
sudo iptables -t filter -N DOCKER-ISOLATION
```

- Inspect docker network:

```shell
docker network ls
```

- Remove All instances:

```shell
docker rm $(docker ps -a -q)
```

- Remove all images:

```shell
docker rmi $(docker images -q)
```

- Create a bridge network to use in topology:

```shell
docker network create -d bridge my-bridge-network
```
