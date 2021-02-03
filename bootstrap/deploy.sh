#!/usr/bin/env bash

set -euf -o pipefail

printf "\033[1;33mTheSystemCloud\033[0m - pushing to production.\n\n"

source ./bootstrap/functions.sh

file_exists .secrets/ssh.env
file_exists bootstrap/init.sh
file_exists bootstrap/services.sh

source .secrets/ssh.env

var_exists $USER \$USER
var_exists $IP \$IP

printf "\033[1;33mTheSystemCloud\033[0m - using ssh user: $USER and ip: $IP\n\n"

if [[ $@ == *"init"* ]]; then
  printf "\033[1;33mTheSystemCloud\033[0m - install dependencies"
  
  file_exists .secrets/db.env

  scp .secrets/db.env $USER@$IP:db.env

  scp .secrets/hetzner.ini $USER@$IP:hetzner.ini

  ssh $USER@$IP bash -s < bootstrap/init.sh

  printf " - done\n\n"
fi

if [[ $@ == *"services"* ]]; then
  printf "\033[1;33mTheSystemCloud\033[0m - install dependencies"
  
  ssh $USER@$IP bash -s < bootstrap/services.sh

  printf " - done\n\n"
fi

printf "\033[1;33mTheSystemCloud\033[0m - cleanup"
  
ssh $USER@$IP rm -f db.env hetzner.ini

printf " - done\n\n"
