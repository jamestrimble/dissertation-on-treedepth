#!/bin/bash

set -euo pipefail

pypy3 lad-stats-sample.py | tee target-graph-stats-sample.txt
#pypy3 lad-stats-all.py | tee target-graph-stats.txt
