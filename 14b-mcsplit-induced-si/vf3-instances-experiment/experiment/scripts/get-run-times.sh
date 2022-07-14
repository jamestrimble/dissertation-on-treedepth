#!/bin/bash

mkdir -p results

#rm -f results/*

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

echo i labels p nt np mcsplit-si-ll mcsplit-si-dom mcsplit-si-dom-D1 msplit-si-dom-D2 mcsplit-si-adjmat mcsplit-si-adjmat-dom glasgow glasgow-nosupp ri ri-ds vf3
cat intermediate/instances.txt | while read i count labels p nt np; do
    echo $(
        echo $i $labels $p $nt $np
        cat program-output/$np-$nt-$p-$labels-$i.mcsplit-si-ll.out | grep Time | awk '{print $3}'
        cat program-output/$np-$nt-$p-$labels-$i.mcsplit-si-dom.out | grep Time | awk '{print $3}'
        cat program-output/$np-$nt-$p-$labels-$i.mcsplit-si-dom-D1.out | grep Time | awk '{print $3}'
        cat program-output/$np-$nt-$p-$labels-$i.mcsplit-si-dom-D2.out | grep Time | awk '{print $3}'
        cat program-output/$np-$nt-$p-$labels-$i.mcsplit-si-adjmat.out | grep Time | awk '{print $3}'
        cat program-output/$np-$nt-$p-$labels-$i.mcsplit-si-adjmat-dom.out | grep Time | awk '{print $3}'
        show_glasgow_time_or_timeout program-output/$np-$nt-$p-$labels-$i.glasgow.out
        cat program-output/$np-$nt-$p-$labels-$i.glasgow-nosupp.out | grep runtime | cut -d' ' -f3
        show_time_or_timeout program-output/$np-$nt-$p-$labels-$i.ri.out
        show_time_or_timeout program-output/$np-$nt-$p-$labels-$i.ri-ds.out
        show_time_or_timeout program-output/$np-$nt-$p-$labels-$i.vf3.out
    )
done
