#!/bin/bash

(
    cd programs/cp2016-code/
    make
)
(
    cd programs/make-assoc-graph/
    make
)
(
    cd programs/IncMC2/
    ./build.sh
)
