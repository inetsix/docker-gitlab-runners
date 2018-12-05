#!/bin/sh

echo "> Register runners to gitlab projects / namespaces"
#REGISTRATION_TOKEN=
REGISTRATION_TOKEN_JNPR_AUTOMATE=vU9mBMhYyYwhExb_WNVy
REGISTRATION_TOKEN_INETSIX=yXAktiLKiPgsH3HPmqhx

#docker exec -it gitlaboncompose_gitlab-runner1_1 gitlab-runner register -n -r $REGISTRATION_TOKEN -u http://gitlab --executor docker --docker-image docker:latest --docker-network-mode gitlaboncompose_default  --docker-volumes "/var/run/docker.sock:/var/run/docker.sock"

docker exec -it dockergitlabrunners_gitlab-runner2_1 gitlab-runner register -n -r $REGISTRATION_TOKEN_INETSIX -u https://gitlab.com/ --executor docker --docker-image docker:latest --docker-network-mode gitlaboncompose_default  --docker-volumes "/var/run/docker.sock:/var/run/docker.sock"

docker exec -it dockergitlabrunners_gitlab-jnpr-automate_1 gitlab-runner register -n -r $REGISTRATION_TOKEN_JNPR_AUTOMATE -u https://gitlab.com/ --executor docker --docker-image docker:latest --docker-network-mode gitlaboncompose_default  --docker-volumes "/var/run/docker.sock:/var/run/docker.sock"

echo "> Regidster runner for git.inetsix.net"

REGISTRATION_TOKEN_GIT_INETSIX=bL2uycz488Y14h5ipiJy
docker exec -it dockergitlabrunners_git-inetsix_1 gitlab-runner register -n -r $REGISTRATION_TOKEN_GIT_INETSIX -u https://git.inetsix.net/ --executor docker --docker-image docker:latest --docker-network-mode gitlaboncompose_default  --docker-volumes "/var/run/docker.sock:/var/run/docker.sock"
