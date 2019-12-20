#!/usr/bin/env sh

toyrun() {
    recipe=$1
    binary=toys/bin/$1
    data=toys/data/$1
    real_incidents=$data/incidents

    if [ -d $data/api ]; then
        api="--api-path=$data/api"
    else
        api=""
    fi
    bap $binary --recipe=$recipe $api > /dev/null 2> /dev/null
    ./compare-incidents $1 $real_incidents incidents --exact
    rm -rf log
    rm -f incidents
}

toysrun() {
    for f in `ls toys/bin`; do
        toyrun $f
    done
}

rm -f toolkit.log
toysrun
