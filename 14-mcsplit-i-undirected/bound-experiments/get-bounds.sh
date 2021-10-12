#!/bin/bash

p=$2
maxlab=$3
i=$4

echo $p $maxlab $i McSplit $(./mcsplit-root-node-bound/mcsp --dimacs --labelled instances/$1.{A,B}.grf | awk '{print $2}')
echo $p $maxlab $i MCSa1 $(java -cp "patrick/distribution/java-20120710/" MaxClique MCSa1 instances/$1.assoc.grf | awk '{print $3}')
echo $p $maxlab $i MCSa2 $(java -cp "patrick/distribution/java-20120710/" MaxClique MCSa2 instances/$1.assoc.grf | awk '{print $3}')
