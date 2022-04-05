#!/bin/bash

set -euo pipefail

cat program-output/*.connected.out | sort | uniq -c

grep -h -R 'Failed' program-output | sort | uniq -c
