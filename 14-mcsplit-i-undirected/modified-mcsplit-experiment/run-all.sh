#!/bin/bash

set -euo pipefail

mkdir -p results
mkdir -p program-output

#time ./run.sh mcsplaininstances
time ./run.sh mcsplainmixandmatchinstances
#time ./run.sh mcs33vedinstances
time ./run.sh randomplaininstances2
time ./run.sh randomplaininstances3
time ./run.sh randomplaininstances4
time ./run.sh barabasialbertinstances
time ./run.sh ba-gnpinstances
time ./run.sh gnminstances
time ./run.sh mcsplaindecisioninstances

#./summarise.sh mcsplaininstances
./summarise.sh mcsplainmixandmatchinstances
#./summarise.sh mcs33vedinstances
./summarise2.sh randomplaininstances2
./summarise2.sh randomplaininstances3
./summarise2.sh randomplaininstances4
./summarise2.sh barabasialbertinstances
./summarise2.sh ba-gnpinstances
./summarise2.sh gnminstances
./summarise_decision_timings.sh mcsplaindecisioninstances

# Check which mix-and-match instances would be swapped by SD and SO
./which-swap.sh mcsplainmixandmatchinstances
