#!/bin/sh
cat docker-compose.yml| grep '\.\./' | cut -f1 -d ":" | cut -f2 -d "-" | tr \" " " > externalRepos.spec
cat externalRepos.spec | xargs -I {} cp -r {} .
docker-compose build

if [ $? -eq 0 ]; then
    cat externalRepos.spec | tr "../" " " | xargs -I {} rm -rf {}
    rm -f externalRepos.spec
    docker-compose up -d
else
    echo "Build Failed !"
fi