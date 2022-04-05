#!/bin/bash

set -euf -o pipefail

python3 scripts/summarise-satisfiability.py < fatanode-results/satisfiability.txt > fatanode-results/satisfiability-with-summary.txt
