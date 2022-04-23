#!/bin/bash

set -euo pipefail

show_vf3_time_or_timeout() {
    FILENAME=$1
    if grep -q 'Failed' $FILENAME; then
        echo "X"
    else
        cat $FILENAME | grep '^[0-9]' | awk '{print $1}'
    fi
}

show_ri_time_or_timeout() {
    FILENAME=$1
    if grep -q 'Failed' $FILENAME; then
        echo "X"
    else
        cat $FILENAME | awk '/number of found matches:/ {print $5}'
    fi
}

show_glasgow_time_or_timeout() {
    FILENAME=$1
    if grep -q 'Failed' $FILENAME; then
        echo "X"
    else
        cat $FILENAME | awk '/status = true/ {print 1} /status = false/ {print 0} /status = aborted/ {print "X"}'
    fi
}

show_mcsplit_time_or_timeout() {
    FILENAME=$1
    cat $FILENAME | awk '/^SATISFIABLE/ {print 1} /^UNSATISFIABLE/ {print 0} /TIMEOUT/ {print "X"}'
}

echo instance mcsplit-si-ll mcsplit-si-dom mcsplit-si-dom-D1 mcsplit-si-dom-D2 mcsplit-si-static mcsplit-si-adjmat-dom glasgow glasgow-nosupp ri ri-ds vf3
cat ../cpaior2019-sbs-for-subgraphs-paper/experiments/instances.txt | while read instance rest; do
    echo $(
        echo $instance
        show_mcsplit_time_or_timeout program-output/$instance.mcsplit-si-ll.out
        show_mcsplit_time_or_timeout program-output/$instance.mcsplit-si-dom.out
        show_mcsplit_time_or_timeout program-output/$instance.mcsplit-si-dom-D1.out
        show_mcsplit_time_or_timeout program-output/$instance.mcsplit-si-dom-D2.out
        show_mcsplit_time_or_timeout program-output/$instance.mcsplit-si-static.out
        show_mcsplit_time_or_timeout program-output/$instance.mcsplit-si-adjmat-dom.out
        show_glasgow_time_or_timeout program-output/$instance.glasgow.out
        show_glasgow_time_or_timeout program-output/$instance.glasgow-nosupp.out
        show_ri_time_or_timeout program-output/$instance.ri.out
        show_ri_time_or_timeout program-output/$instance.ri-ds.out
        if grep -q 'Disconnected' program-output/$instance.connected.out; then
            echo X
        else
            show_vf3_time_or_timeout program-output/$instance.vf3.out
        fi
    )
done
