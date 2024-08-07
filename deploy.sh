#!/usr/bin/env bash
export NIX_SSHOPTS="-A"

build_remote=false

hosts="$1"
shift

if [ -z "$hosts" ]; then
    echo "No hosts to deploy"
    exit 2
fi

for host in ${hosts//,/ }; do
  nixos-rebuild --flake .\#$host switch --build-host $(hostname) --target-host $host --use-remote-sudo --log-format internal-json -v |& nom --json $@
done
