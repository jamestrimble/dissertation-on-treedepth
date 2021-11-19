#!/bin/bash

set -euo pipefail

./run.sh mcsplaininstances
./run.sh mcsplainmixandmatchinstances
./run.sh mcs33vedinstances
./run.sh randomplaininstances2
./run.sh randomplaininstances3
./run.sh mcsplaindecisioninstances

./summarise.sh mcsplainmixandmatchinstances
./summarise.sh mcsplaininstances
./summarise.sh mcs33vedinstances
./summarise2.sh randomplaininstances2
./summarise2.sh randomplaininstances3
./summarise_decision_timings.sh mcsplaindecisioninstances

