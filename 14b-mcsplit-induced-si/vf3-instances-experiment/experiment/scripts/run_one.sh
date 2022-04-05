#!/bin/bash

set -euo pipefail

extratime=100

i=$1
labels=$2
p=$3
nt=$4
np=$5
timelimit=$6

mkdir -p instances
mkdir -p program-output

pf=instances/${np}-${nt}-$p-${labels}-$i-pattern.grf
tf=instances/${np}-${nt}-$p-${labels}-$i-target.grf
out=program-output/${np}-${nt}-$p-${labels}-$i
../random-graph-generator/gen $np $nt $p $labels $i $pf $tf
python3 ../scripts/vf_to_gfd.py $pf > $pf.gfd
python3 ../scripts/vf_to_gfd.py $tf > $tf.gfd
awk -f ../scripts/vf_to_csv.awk < $pf > $pf.csv
awk -f ../scripts/vf_to_csv.awk < $tf > $tf.csv

timeout $(($timelimit + $extratime)) ../programs/vf3lib/bin/vf3 -r0 $pf $tf > $out.vf3.out \
        2> $out.vf3.err \
        || echo Failed $? >> $out.vf3.out
timeout $(($timelimit + $extratime)) ../programs/RI/ri36_with_timing ind gfd $tf.gfd $pf.gfd > $out.ri.out \
        || echo Failed $? >> $out.ri.out
timeout $(($timelimit + $extratime)) ../programs/RI-DS/ri351ds_with_timing ind gfd $tf.gfd $pf.gfd > $out.ri-ds.out \
        || echo Failed $? >> $out.ri-ds.out
timeout $(($timelimit + $extratime)) ../programs/glasgow-subgraph-solver/glasgow_subgraph_solver \
    --enumerate --format csv --induced $pf.csv $tf.csv --timeout $timelimit > $out.glasgow.out \
        || echo Failed $? >> $out.glasgow.out
../programs/glasgow-subgraph-solver/glasgow_subgraph_solver \
    --enumerate --no-supplementals --format csv --induced $pf.csv $tf.csv --timeout $timelimit > $out.glasgow-nosupp.out
../programs/mcsplit-si/mcsplit-si --enumerate --VF B $pf $tf --timeout $timelimit > $out.mcsplit-si.out
../programs/mcsplit-si/mcsplit-si-adjmat --enumerate --VF B $pf $tf --timeout $timelimit > $out.mcsplit-si-adjmat.out
../programs/mcsplit-si/mcsplit-si --enumerate --VF A $pf $tf --timeout $timelimit > $out.mcsplit-si-dom.out
../programs/mcsplit-si/mcsplit-si --enumerate --VF -D1 A $pf $tf --timeout $timelimit > $out.mcsplit-si-dom-D1.out
../programs/mcsplit-si/mcsplit-si --enumerate --VF -D2 A $pf $tf --timeout $timelimit > $out.mcsplit-si-dom-D2.out
../programs/mcsplit-si/mcsplit-si-adjmat --enumerate --VF A $pf $tf --timeout $timelimit > $out.mcsplit-si-adjmat-dom.out
../cpp-utils/is-connected/is_vf_connected < $pf > $out.connected.out
../cpp-utils/is-connected/is_vf_connected < $tf >> $out.connected.out

rm $pf
rm $tf
rm $pf.*
rm $tf.*
