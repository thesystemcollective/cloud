#!/usr/bin/env bash

set -euf -o pipefail

printf "\033[1;33mTheSystemCloud\033[0m - pushing to production.\n\n"

source ./bootstrap/functions.sh

file_exists .secrets/ssh.env
file_exists .secrets/db.env
file_exists bootstrap/init.sh

source .secrets/ssh.env

var_exists $USER \$USER
var_exists $IP \$IP

echo "using ssh user: $USER and ip: $IP"

scp .secrets/db.env $USER@$IP:db.env

ssh $USER@$IP bash -s < bootstrap/init.sh
