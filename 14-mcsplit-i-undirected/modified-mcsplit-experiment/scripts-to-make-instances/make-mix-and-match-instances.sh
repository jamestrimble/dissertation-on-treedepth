#!/bin/bash

set -euo pipefail

python3 make-mix-and-match-instances.py 1000 < ../plots-based-on-ijcai-paper/experiments/mcsplaininstances.txt > mcsplainmixandmatchinstances.txt
