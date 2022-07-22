#!/bin/bash
declare -a SCRIPTS
SCRIPTS=(`echo $RUN_SCRIPTS | awk 'BEGIN{FS=","}{for (i=1; i<=NF; i++) print $i}'`)

for script in "${SCRIPTS[@]}"; do
    nohup python -u $script.py | appendTS -n $script > /proc/1/fd/1 2>/proc/1/fd/2 2>&1 &
done
trap "pkill -P $$" INT TERM
wait