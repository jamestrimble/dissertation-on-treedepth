#!/bin/bash

set -euo pipefail

shuf -n$2 instance-lists/$1.txt > $1.sample.txt
