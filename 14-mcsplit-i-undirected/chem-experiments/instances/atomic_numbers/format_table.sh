#!/bin/bash

cat from_wikipedia.txt | awk 'NR>2' | cut -f1,2 | awk '{print "atom_to_int[\"" $2 "\"] = " $1 ";"}'
