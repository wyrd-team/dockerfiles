#!/bin/sh
set -eu

getenvs() {
  echo devel
  results=$(find . -name 'Dockerfile' -type f -depth 2 -exec dirname {} \;)
  for i in "${results[@]}"
  do
    basename $i
  done | grep -v devel
}

envs=($(getenvs))

echo "push docker image wyrdteam/anyenv:latest-buster"
docker push wyrdteam/anyenv:latest-buster
for i in "${envs[@]}"
do
  echo "push docker image wyrdteam/anyenv:latest-buster-$i"
  docker push "wyrdteam/anyenv:latest-buster-$i"
done
