#!/bin/sh

docker-compose build

workdir=${PWD##*/}

cd ..
filename="docker-compose-$workdir.yml"
sed 's/\.\.\//\.\//g' $workdir/docker-compose.yml > $filename
workdir="$workdir/"
docker-compose -f $filename up
cd $workdir
