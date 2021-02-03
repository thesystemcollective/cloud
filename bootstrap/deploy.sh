#!/usr/bin/env bash

set -euf -o pipefail

printf "\033[1;33mTheSystemCloud\033[0m - pushing to production.\n\n"

source .secrets/.env

ssh $USER@$IP bash -s < bootstrap/init.sh

