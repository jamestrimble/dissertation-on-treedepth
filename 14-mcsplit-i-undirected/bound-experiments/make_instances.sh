#!/bin/bash

mkdir -p instances

for p in $(seq 1 9); do
    echo p = $p
    for maxlab in $(seq 1 20); do
        for i in $(seq 1 10); do
            python random-labelled-graph/random_graph.py 20 0.$p $maxlab > instances/$p-$maxlab-$i.A.grf
            python random-labelled-graph/random_graph.py 20 0.$p $maxlab > instances/$p-$maxlab-$i.B.grf
            python dimacs-to-clique/to_max_clique.py instances/$p-$maxlab-$i.{A,B}.grf > instances/$p-$maxlab-$i.assoc.grf
        done
    done
done
