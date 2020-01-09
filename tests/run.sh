#!/usr/bin/env sh

XFAILS_CONCEPTS="warn-unused must-check-value"
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

read_descr() {
    unset check_name
    unset params

    params=`cat $1 | grep params`
    params=${params#"params:"}
    params=`echo $params`

    check_name=`cat $1 | grep name`
    check_name=${check_name#"name:"}
    check_name=`echo $check_name`
}


artifacts_run() {
    echo "                         ARTIFACTS (patience!)"
    dir=artifacts

    for arti in `ls $dir`; do
        docker run --rm -v `pwd`:/drive binaryanalysisplatform/bap-artifacts:$arti cp /artifact /drive

        for recipe in `ls $dir/$arti`; do
            real_incidents=$dir/$arti/$recipe/incidents
            descr=$dir/$arti/$recipe/descr

            name=$arti/$recipe

            if [ -f $descr ]; then
                read_descr $descr
                if [ "no$params" != "no" ]; then
                    recipe="$recipe:$params"
                fi
                if [ "no$check_name" != "no" ]; then
                    name=$check_name
                fi
            fi

            bap artifact --recipe=$recipe  > /dev/null 2> /dev/null
            ./compare-incidents $name $real_incidents incidents
            rm -f incidents
        done
        rm -f artifact
    done
}

rm -rf log
rm -f toolkit.log
concepts_run
artifacts_run
