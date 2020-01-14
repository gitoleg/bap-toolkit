#!/usr/bin/env sh

XFAILS="warn-unused must-check-value"
# Reasons:
# 1) Taint analysis Garbage collector need to be fixed:
#    the finished observation never reached it, need use halting.
#    Checks warn-unused must-check-value are rely on it.
# 2) Also, warn-unused may fail because we need to fix attributes on
#    in callsites plugin, since they are not tranfered from the original
#    argument.
#

logfile="toolkit.log"

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
    for c in $XFAILS; do
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

file_not_found() {
    bug="ERROR: $1 not found"
    echo $bug >> $logfile
    echo ""   >> $logfile
    echo $bug
}


artifacts_run() {
    echo "                         ARTIFACTS (patience!)"
    dir=artifacts

    for arti in `ls $dir`; do
        for check in `ls $dir/$arti | grep -v artifact`; do
            artifact=$dir/$arti/artifact

            if [ ! -f $artifact ]; then
                file_not_found $artifact
                continue
            fi

            real_incidents=$dir/$arti/$check/incidents
            run=$dir/$arti/$check/run
            api=$dir/$arti/$check/api

            if [ ! -f $run ]; then
                file_not_found $run
                continue
            fi

            api_path=
            if [ -d $api ]; then
                api_path="--api-path=$api"
            fi

            recipe=`cat $run`

            cve=`echo $check | grep CVE`
            if [ "no$cve" = "no" ]; then
                name=$arti/$check
            else
                name=$check
            fi

            start=`date | cut -d' ' -f4`
            echo $name $start bap $artifact $recipe $api_path >> toolkit.log
            bap $artifact $recipe $api_path > /dev/null 2> /dev/null
            finish=`date | cut -d' ' -f4`
            echo "$finish finished" >> toolkit.log
            result=`./compare-incidents $name $real_incidents incidents`
            echo $result
            echo "" >> toolkit.log

            rm -f incidents

        done
    done
}

rm -rf log
rm -f toolkit.log

start=`date | cut -d' ' -f4`
echo "started at $start" >> toolkit.log
#concepts_run
echo ""
artifacts_run
