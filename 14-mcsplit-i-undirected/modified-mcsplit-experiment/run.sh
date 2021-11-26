#!/bin/bash

set -euo pipefail

TIMEOUT=300
NUM_INSTANCES=750

#INSTANCETYPE should be mcs33vedinstances or mcsplaininstances etc.
INSTANCETYPE=$1

./make-subset.sh $INSTANCETYPE $NUM_INSTANCES

rm -rf program-output/$INSTANCETYPE
mkdir -p program-output/$INSTANCETYPE

python3 make-commands.py $INSTANCETYPE $TIMEOUT > commands.txt

parallel --bar < commands.txt
