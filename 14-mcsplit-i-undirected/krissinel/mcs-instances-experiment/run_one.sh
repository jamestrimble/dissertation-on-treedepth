#!/bin/bash

g=$1
h=$2
instance=$3
timelimit=1000
timelimit_plus_a_bit=$((timelimit + 5))

check_mcsplit_timeout() {
    f=$1
    if grep -q TIMEOUT $f; then
        echo "CPU - - 1000" > $f
        echo "Count -1" >> $f
    fi
}

./from_binary $g > graphs/$instance.pattern.grf
./from_binary $h > graphs/$instance.target.grf

g=graphs/$instance.pattern.grf
h=graphs/$instance.target.grf

../new-mcsplit-modified/mcsp --timeout $timelimit --dimacs --quiet min_max 0 $g $h | grep -E 'TIMEOUT|CPU time|Count' > program-output/${instance}.mcsp0.txt
../new-mcsplit-modified/mcsp --timeout $timelimit --dimacs --quiet min_max 1 $g $h | grep -E 'TIMEOUT|CPU time|Count' > program-output/${instance}.mcsp1.txt
../new-mcsplit-modified/mcsp --timeout $timelimit --dimacs --quiet min_max 2 $g $h | grep -E 'TIMEOUT|CPU time|Count' > program-output/${instance}.mcsp2.txt
../new-mcsplit-modified/mcsp --timeout $timelimit --dimacs --quiet min_max 3 $g $h | grep -E 'TIMEOUT|CPU time|Count' > program-output/${instance}.mcsp3.txt

check_mcsplit_timeout program-output/${instance}.mcsp0.txt
check_mcsplit_timeout program-output/${instance}.mcsp1.txt
check_mcsplit_timeout program-output/${instance}.mcsp2.txt
check_mcsplit_timeout program-output/${instance}.mcsp3.txt

timeout $timelimit_plus_a_bit ../../../../krissinel/csm-modified/mmdb2/a.out $g $h 0 > program-output/${instance}.csia.tmp.txt
if [ "$?" -eq "124" ]; then
    echo "nMatches: -1" > program-output/${instance}.csia.txt
    echo "time: 1000" >> program-output/${instance}.csia.txt
else
    cat program-output/${instance}.csia.tmp.txt | grep -E 'nMatches|time' > program-output/${instance}.csia.txt
fi

