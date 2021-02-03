#!/usr/bin/env bash

set -euf -o pipefail

printf "\033[1;33mTheSystemCloud\033[0m - installing dependencies - "

apt update # >> /var/log/TheSystemCloud-install.log 2>&1

apt upgrade # >> /var/log/TheSystemCloud-install.log 2>&1

apt install docker.io docker-compose git # >> /var/log/TheSystemCloud-install.log 2>&1

printf "done \n\n"

printf "\033[1;33mTheSystemCloud\033[0m - cloning thesystemcollective/cloud - "

DIR="~/cloud"

if [ ! -d "$DIR" ] ; then
  git clone --depth 1 git://github.com/thesystemcollective/cloud $DIR # >> /var/log/TheSystemCloud-install.log 2>&1
  cd "$DIR"
else
  cd "$DIR"
  git pull origin master # >> /var/log/TheSystemCloud-install.log 2>&1
fi

printf "done \n\n"

printf "\033[1;33mTheSystemCloud\033[0m - starting docker containers\n\n"

docker-compose up -d # >> /var/log/TheSystemCloud-install.log 2>&1

printf "\033[1;33mTheSystemCloud\033[0m - done.\n\n"
