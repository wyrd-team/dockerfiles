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

set +e
echo "remove docker image wyrdteam/anyenv:latest-buster"
docker rmi wyrdteam/anyenv:latest-buster
for i in "${envs[@]}"
do
  echo "remove docker image wyrdteam/anyenv:latest-buster-$i"
  docker rmi "wyrdteam/anyenv:latest-buster-$i"
done

set -e
echo "build docker image wyrdteam/anyenv:latest-buster"
docker build -t wyrdteam/anyenv:latest-buster .
for i in "${envs[@]}"
do
  echo "build docker image wyrdteam/anyenv:latest-buster-$i"
  docker build -t "wyrdteam/anyenv:latest-buster-$i" "$i"
done
