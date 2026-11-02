#!/usr/bin/env bash
set -e
DIR=~/Downloads

dl_ver() {
    local ver=$1
    local file=flyway-commandline-${ver}.tar.gz
    local lfile=$DIR/$file
    local url="https://github.com/flyway/flyway/releases/download/flyway-${ver}/${file}"

    if [ ! -e "$lfile" ];
    then
        curl -fsSL --proto '=https' --tlsv1.2 -o "$lfile" "$url"
    fi
    local sum
    sum=$(sha256sum "$lfile" | awk '{print $1}')
    if ! printf '%s' "$sum" | grep -Eq '^[0-9a-f]{64}$'; then
        echo "bad checksum for $url" >&2
        exit 1
    fi

    printf "  # %s\n" "$url"
    printf "  '%s': sha256:%s\n" "$ver" "$sum"
}

for v in "${@:-13.12.0}"; do
    dl_ver "$v"
done
