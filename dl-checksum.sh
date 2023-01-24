#!/usr/bin/env sh
set -e
DIR=~/Downloads

dl_ver() {
    local ver=$1
    local file=flyway-commandline-${ver}.tar.gz
    local lfile=$DIR/$file
    local url=https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${ver}/$file

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "  # %s\n" $url
    printf "  '%s': sha256:%s\n" $ver $(sha256sum $lfile | awk '{print $1}')
}

dl_ver ${1:-9.12.0}
