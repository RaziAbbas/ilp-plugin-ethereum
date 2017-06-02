#!/usr/bin/env bash
set -e

name=ilp
chains_dir=$HOME/.monax/chains
name_full="$name"_full_000
chain_dir="$chains_dir"/"$name"
CHAIN_ID=$name

# monax chains make ilp
# monax chains start ilp --init-dir ilp/ilp_full_000

BURROW_CLIENT_ADDRESS=$(cat $chain_dir/addresses.csv | grep $name_full | cut -d ',' -f 1)
echo "Marmots will act from full account"
echo "BURROW_CLIENT_ADDRESS" $BURROW_CLIENT_ADDRESS

monax pkgs do -c $CHAIN_ID -a $BURROW_CLIENT_ADDRESS -f epm.yaml
cp jobs_output.json result_deploy.json