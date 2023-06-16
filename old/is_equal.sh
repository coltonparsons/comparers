#!/usr/bin/env bash

function is_equal(){
    jq -n '$ARGS.positional | .[0] == .[1]' --jsonargs -- "$1" "$2"
}

n_wrong=0

while read test_vector; do
    a=$(jq '.[0]' <<<$test_vector)
    b=$(jq '.[1]' <<<$test_vector)
    expected=$(jq '.[2]' <<<$test_vector)

    if [[ $(is_equal "$a" "$b") != $expected ]]; then
        echo "Failed $test_vector"
        n_wrong=$[n_wrong+1]
    fi
done < <(jq -c '.[]')

if [[ $n_wrong -eq 0 ]]; then
    echo "All passed."
else
    echo "Missed $[n_wrong] tests"
    exit 1
fi
