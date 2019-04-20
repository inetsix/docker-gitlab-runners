#!/bin/sh

echo "Start runner registration ..."

source "./env.runners"

echo "  * Check if vars are defined"
if [ -z ${GIT_SERVER} ]; then echo "    - GIT_SERVER is unset"; fi
if [ -z ${TOKEN_REGISTRATION} ]; then echo "    - TOKEN_REGISTRATION is unset"; fi
if [ -z ${TAGS} ]; then echo "    - TAGS is unset"; fi

for RUNNER in `docker-compose ps | grep Up | awk '{print $1}'`; do
	echo "  * Register runner ${RUNNER} to ${GIT_SERVER} / ${TOKEN_REGISTRATION}"
  docker exec -it ${RUNNER} gitlab-runner register \
	  --non-interactive \
	  --url ${GIT_SERVER} \
	  --registration-token ${TOKEN_REGISTRATION} \
	  --executor "docker" \
	  --docker-image alpine:3 \
	  --description "docker-runner" \
	  --tag-list ${TAGS} \
	  --run-untagged \
	  --locked="false" \
	  --docker-privileged
done
