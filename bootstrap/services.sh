#!/usr/bin/env bash

set -euf -o pipefail

printf "\033[1;33mTheSystemCloud\033[0m - cloning thesystemcollective/cloud - "

cd ~

if [ ! -d "cloud" ] ; then
  git clone --depth 1 git://github.com/thesystemcollective/cloud # >> /var/log/TheSystemCloud-install.log 2>&1
  cd "cloud"
else
  cd "cloud"
  git pull origin master # >> /var/log/TheSystemCloud-install.log 2>&1
fi

printf "done \n\n"

printf "\033[1;33mTheSystemCloud\033[0m - starting docker containers\n\n"

docker-compose up -d # >> /var/log/TheSystemCloud-install.log 2>&1

printf "\033[1;33mTheSystemCloud\033[0m - done.\n\n"
