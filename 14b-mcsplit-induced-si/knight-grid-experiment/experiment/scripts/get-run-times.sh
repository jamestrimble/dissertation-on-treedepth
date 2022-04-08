#!/bin/bash

set -euo pipefail

mkdir -p results

rm -f results/*

show_time_or_timeout() {
    FILENAME=$1
    if grep -q 'Failed' $FILENAME; then
        echo "TIMEOUT"
    else
        cat $FILENAME | grep TIME | awk '{print $2}'
    fi
}

show_glasgow_time_or_timeout() {
    FILENAME=$1
    if grep -q 'Failed' $FILENAME; then
        echo "TIMEOUT"
    else
        cat $FILENAME | grep runtime | cut -d' ' -f3
    fi
}

echo instance mcsplit-si mcsplit-si-dom mcsplit-si-dom-D1 mcsplit-si-dom-D2 mcsplit-si-static mcsplit-si-adjmat-dom glasgow glasgow-nosupp ri ri-ds vf3
cat instances.txt | while read instance rest; do
    echo $(
        echo $instance
        cat program-output/$instance.mcsplit-si.out | grep Time | awk '{print $3}'
        cat program-output/$instance.mcsplit-si-dom.out | grep Time | awk '{print $3}'
        cat program-output/$instance.mcsplit-si-dom-D1.out | grep Time | awk '{print $3}'
        cat program-output/$instance.mcsplit-si-dom-D2.out | grep Time | awk '{print $3}'
        cat program-output/$instance.mcsplit-si-static.out | grep Time | awk '{print $3}'
        cat program-output/$instance.mcsplit-si-adjmat-dom.out | grep Time | awk '{print $3}'
        show_glasgow_time_or_timeout program-output/$instance.glasgow.out
        cat program-output/$instance.glasgow-nosupp.out | grep runtime | cut -d' ' -f3
        show_time_or_timeout program-output/$instance.ri.out
        show_time_or_timeout program-output/$instance.ri-ds.out
        if grep -q 'Disconnected' program-output/$instance.connected.out; then
            echo DISCONNECTED
        else
            show_time_or_timeout program-output/$instance.vf3.out
        fi
    )
done
