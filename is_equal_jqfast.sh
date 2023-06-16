#!/usr/bin/env bash

results=$(jq -r '.[] | if (.[0] == .[1]) == .[2] then empty else "Failed \(.)" end')

n_wrong="$[$(<<<$results wc -l)]"

if [[ -z $results ]]; then
    echo "All passed."
else
    <<<$results cat
    echo "Missed $[n_wrong] tests"
    exit 1
fi
