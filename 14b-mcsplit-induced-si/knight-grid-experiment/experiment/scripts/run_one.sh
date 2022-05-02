#!/bin/bash

set -euo pipefail

extratime=100

instance=$1
file_a=$2
file_b=$3
timelimit=$4

mkdir -p instances
mkdir -p program-output

pf=lad-graphs/$file_a.lad
tf=lad-graphs/$file_b.lad
out=program-output/$instance
../../vf3-instances-experiment/cpp-utils/ciaran-lad2arg-modified/lad2arg < $pf > instances/$instance.pattern.grf
../../vf3-instances-experiment/cpp-utils/ciaran-lad2gfu/lad2gfu < $pf > instances/$instance.pattern.gfu
../../vf3-instances-experiment/cpp-utils/ciaran-lad2arg-modified/lad2arg < $tf > instances/$instance.target.grf
../../vf3-instances-experiment/cpp-utils/ciaran-lad2gfu/lad2gfu < $tf > instances/$instance.target.gfu

(../../vf3-instances-experiment/cpp-utils/is-connected/is_lad_connected < $pf || true) > $out.connected.out
(../../vf3-instances-experiment/cpp-utils/is-connected/is_lad_connected < $tf || true) >> $out.connected.out

if grep -q 'Disconnected' $out.connected.out; then
    echo "DISCONNECTED" > $out.vf3.out
else
    timeout $(($timelimit + $extratime)) ../../vf3-instances-experiment/programs/vf3lib/bin/vf3_first_match_only -u -r0 \
        instances/$instance.pattern.grf instances/$instance.target.grf > $out.vf3.out \
            || echo Failed $? >> $out.vf3.out
fi
timeout $(($timelimit + $extratime)) ../../vf3-instances-experiment/programs/RI/ri36_decision_with_timing ind gfu \
        instances/$instance.target.gfu instances/$instance.pattern.gfu > $out.ri.out \
        || echo Failed $? >> $out.ri.out
timeout $(($timelimit + $extratime)) ../../vf3-instances-experiment/programs/RI-DS/ri351ds_decision_with_timing ind gfu \
        instances/$instance.target.gfu instances/$instance.pattern.gfu > $out.ri-ds.out \
        || echo Failed $? >> $out.ri-ds.out
timeout $(($timelimit + $extratime)) ../../vf3-instances-experiment/programs/glasgow-subgraph-solver/glasgow_subgraph_solver \
    --format lad --induced $pf $tf --timeout $timelimit > $out.glasgow.out \
        || echo Failed $? >> $out.glasgow.out
../../vf3-instances-experiment/programs/glasgow-subgraph-solver/glasgow_subgraph_solver \
    --no-supplementals --format lad --induced $pf $tf --timeout $timelimit > $out.glasgow-nosupp.out

# -s 1000000 is a million second CPU time limit (to avoid stopping early),
# -f is stop at first solution, -i is induced
timeout $(($timelimit + $extratime)) ../../vf3-instances-experiment/programs/pathLAD/main \
    -s 1000000 -i -f \
    -p double-edged-$pf -t double-edged-$tf > $out.pathlad.out \
        || echo Failed $? >> $out.pathlad.out

../../vf3-instances-experiment/programs/mcsplit-si/mcsplit-si-ll --lad A $pf $tf --timeout $timelimit > $out.mcsplit-si-ll.out
../../vf3-instances-experiment/programs/mcsplit-si/mcsplit-si --lad RI $pf $tf --timeout $timelimit > $out.mcsplit-si-static.out
../../vf3-instances-experiment/programs/mcsplit-si/mcsplit-si --lad A $pf $tf --timeout $timelimit > $out.mcsplit-si-dom.out
../../vf3-instances-experiment/programs/mcsplit-si/mcsplit-si -D1 --lad A $pf $tf --timeout $timelimit > $out.mcsplit-si-dom-D1.out
../../vf3-instances-experiment/programs/mcsplit-si/mcsplit-si -D2 --lad A $pf $tf --timeout $timelimit > $out.mcsplit-si-dom-D2.out
../../vf3-instances-experiment/programs/mcsplit-si/mcsplit-si-adjmat --lad A $pf $tf --timeout $timelimit > $out.mcsplit-si-adjmat-dom.out

rm instances/$instance.pattern.grf
rm instances/$instance.pattern.gfu
rm instances/$instance.target.grf
rm instances/$instance.target.gfu
