#!/bin/bash

mkdir -p instances

echo p,maxlab,i,algorithm,bound
for p in $(seq 1 9); do
    for maxlab in $(seq 1 20); do
        for i in $(seq 1 10); do
            ./get-bounds.sh $p-$maxlab-$i $p $maxlab $i | tr ' ' ','
        done
    done
done
