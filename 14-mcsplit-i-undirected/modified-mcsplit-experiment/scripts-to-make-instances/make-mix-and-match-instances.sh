#!/bin/bash

set -euo pipefail

python3 scripts-to-make-instances/make-mix-and-match-instances.py 1000 < ../plots-based-on-ijcai-paper/experiments/mcsplaininstances.txt > instance-lists/mcsplainmixandmatchinstances.txt
