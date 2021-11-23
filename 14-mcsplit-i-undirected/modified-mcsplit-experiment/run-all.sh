#!/bin/bash

set -euo pipefail

time ./run.sh mcsplaininstances
time ./run.sh mcsplainmixandmatchinstances
time ./run.sh mcs33vedinstances
time ./run.sh randomplaininstances2
time ./run.sh randomplaininstances3
time ./run.sh randomplaininstances4
time ./run.sh mcsplaindecisioninstances

./summarise.sh mcsplainmixandmatchinstances
./summarise.sh mcsplaininstances
./summarise.sh mcs33vedinstances
./summarise2.sh randomplaininstances2
./summarise2.sh randomplaininstances3
./summarise2.sh randomplaininstances4
./summarise_decision_timings.sh mcsplaindecisioninstances

