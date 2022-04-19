#!/bin/bash

set -euo pipefail

python3 create-fig.py
python3 create-fig.py 1a x0011 x11010
python3 create-fig.py 1a,2d xx123 x33x21
python3 create-fig.py 1a,2d,3f xxx47 x77x5x

