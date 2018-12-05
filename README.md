# Docker Compose VPS

Repository to centralize docker definition to run CI Runners for GITLAB servers:

- `gitlab-runner1`: Unregistered runner
- `gitlab-runner2`: Registered to [gitlab.com / inetsix](https://gitlab.com/inetsix/)
- `gitlab-jnpr-automate`: Registered to [gitlab.com / jnprautomate](https://gitlab.com/jnprautomate)
- `git-inetsix`: Registered to [git.inetsix.net](https://git.inetsix.net)

Runners are configured to run any docker containers as CI environment (docker-executor) and `docker in docker` (dind) as well to build docker image

## Install docker compose:

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

## Start topology

In the repository:

```shell
docker-compose up -d --build
```

## Upgrade images:

```shell
docker-compose stop
for image in `cat docker-compose.yml | grep image | awk -F ": " '{print $2}'`; do
docker pull $image
done
docker-compose up -d --build
```

## Debug

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
