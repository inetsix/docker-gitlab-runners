#!/bin/sh

echo "Create folder for runner configs"
for runner in `cat docker-compose.yml | grep container_name | awk -F ": " '{print $2}'`; do
  echo  $runner
  if [ -d "$runner" ]; then
    echo "  * Folder already present, ignored"
  else
    echo "  * Create folder for $runner"
    mkdir $runner
  fi  
done

