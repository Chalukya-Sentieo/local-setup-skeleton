#!/bin/sh
execres=0

# Handle cleanup on ctrl+c
ctrl_c() {
    cat externalRepos.spec | tr "../" " " | xargs -I {} rm -rf {}
    rm -f externalRepos.spec
}

if [ $# -eq 0 ] ;then
    echo "Skipping Build !"
elif [ "$1" = "build" ] ;then
    echo "Running Build !"
    cat docker-compose.yml| grep '\.\./' | cut -f1 -d ":" | cut -f2 -d "-" | tr \" " " | sort -u > externalRepos.spec
    cat externalRepos.spec | xargs -I {} cp -r {} .
    trap ctrl_c INT
    docker-compose build
    execres=$?
fi
ctrl_c
if [ $execres -eq 0 ]; then
    docker-compose up -d
else
    echo "Build Failed !"
fi