#!/usr/bin/env sh

XFAILS_CONCEPT="warn-unused must-check-value"
# Reasons:
# 1) Taint analysis Garbage collector need to be fixed:
#    the finished observation never reached it, need use halting.
#    Checks warn-unused must-check-value are rely on it.
# 2) Also, warn-unused may fail because we need to fix attributes on
#    in callsites plugin, since they are not tranfered from the original
#    argument.
#

concept_run() {
    recipe=$1
    binary=concepts/bin/$1
    data=concepts/data/$1
    real_incidents=$data/incidents

    if [ -d $data/api ]; then
        api="--api-path=$data/api"
    else
        api=""
    fi
    bap $binary --recipe=$recipe $api > /dev/null 2> /dev/null

    expected_fail=""
    for c in $XFAILS_CONCEPTS; do
        if [ "expected$c" = "expected$recipe" ]; then
            expected_fail="--expect-fail"
        fi
    done

    ./compare-incidents $1 $real_incidents incidents --exact $expected_fail
    rm -f incidents
}

concepts_run() {
    echo "                              CONCEPTS"

    for f in `ls concepts/bin`; do
        concept_run $f
    done
}

artifacts_run() {
    echo "                         ARTIFACTS (patience!)"
    data=artifacts/data

    for arti in `ls $data`; do
        docker run -ti --rm -v `pwd`:/drive binaryanalysisplatform/bap-artifacts:$arti cp /artifact /drive

        for recipe in `ls $data/$arti`; do
            real_incidents=$data/$arti/$recipe/incidents
            bap artifact --recipe=$recipe  > /dev/null 2> /dev/null
            ./compare-incidents $arti/$recipe $real_incidents incidents
            rm -f incidents
        done
        rm -f artifact
    done
}

rm -rf log
rm -f toolkit.log
concepts_run
artifacts_run
