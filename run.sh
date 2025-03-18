#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "usage: $0 <path-to-contender> <rpc-url>"
  exit 1
fi

CONTENDERPATH="$1"
CONTENDER="$CONTENDERPATH/target/debug/contender"
RPC_URL="$2"

if [ -z "$PRK" ]; then
  PRK="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"
fi

echo "using wallet address: $(cast wallet address $PRK)"

while true; do
  $CONTENDER run fill-block $RPC_URL -p $PRK --sdp -d 20 -i 1 -n 50
done
