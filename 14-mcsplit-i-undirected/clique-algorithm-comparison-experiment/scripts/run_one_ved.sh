#!/bin/bash

i=$1
p=../$2
t=../$3

timelimit=1000
timelimit_plus=1100

./programs/make-assoc-graph/solve_max_common_subgraph $p $t > association-graphs-ved/$i.grf

./programs/cp2016-code/solve_max_common_subgraph --timeout $timelimit $p $t > program-output-ved/$i.cp2016.txt 2>/dev/null

timeout $timelimit_plus ./programs/IncMC2/IncMC2 association-graphs-ved/$i.grf > program-output-ved/$i.incmc2.txt
if [ "$?" -eq "124" ]; then echo TIMEOUT > program-output-ved/$i.incmc2.txt; fi

timeout $timelimit_plus ./programs/IncMC2/IncMC2 association-graphs-ved/$i.grf -o 1 > program-output-ved/$i.incmc2o1.txt
if [ "$?" -eq "124" ]; then echo TIMEOUT > program-output-ved/$i.incmc2o1.txt; fi

timeout $timelimit_plus ./programs/IncMC2/IncMC2 association-graphs-ved/$i.grf -o 2 > program-output-ved/$i.incmc2o2.txt
if [ "$?" -eq "124" ]; then echo TIMEOUT > program-output-ved/$i.incmc2o2.txt; fi

rm association-graphs-ved/$i.grf
