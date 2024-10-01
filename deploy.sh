#!/usr/bin/env bash
export NIX_SSHOPTS="-A"

hostname=$(hostname)
target_hosts="$1"
shift

if [ -z "$target_hosts" ]; then
    echo "No hosts to deploy"
    exit 2
fi

for target_host in ${target_hosts//,/ }; do
  nixos-rebuild switch --flake .#$target_host --target-host $target_host --build-host $hostname --use-remote-sudo --use-substitutes --log-format internal-json -v $@
done
