#!/usr/bin/env bash

set -euf -o pipefail

printf "\033[1;33mTheSystemCloud\033[0m - installing dependencies.\n\n"

apt update >> /var/log/grundstein-install.log 2>&1

apt upgrade >> /var/log/grundstein-install.log 2>&1

apt install docker.io docker-compose git >> /var/log/grundstein-install.log 2>&1


printf "\033[1;33mTheSystemCloud\033[0m - cloning thesystemcollective/cloud.\n\n"

git clone git://github.com/thesystemcollective/cloud  # >> /var/log/grundstein-install.log 2>&1

cd cloud

echo ls -ls

# docker-compose up -d
