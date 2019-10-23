#!/usr/bin/env sh
VER=${1:-6.0.7}
DIR=~/Downloads
FILE=flyway-commandline-${VER}.tar.gz
LFILE=$DIR/$FILE
URL=https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${VER}/$FILE

if [ ! -e $LFILE ];
then
    wget -q -O $LFILE $URL
fi

printf "  # %s\n" $URL
printf "  '%s': sha256:%s\n" $VER $(sha256sum $LFILE | awk '{print $1}')
