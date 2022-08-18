#!/bin/bash

set -euo pipefail

python3 place-queens.py
python3 place-queens.py A1
python3 place-queens.py A1 C2
python3 place-queens.py A1 D2
python3 place-queens.py A1 D2 B3
python3 place-queens.py B1
python3 place-queens.py B1 D2
python3 place-queens.py B1 D2 A3
python3 place-queens.py B1 D2 A3 C4

