#!/bin/bash

awk '
NR > 1 {
  grid_a = NR
  for (i=1;i<=NF;i++) {
    board_sz = i + 2;
    grid_b = $i;
    print "grid" grid_a "-" grid_b "-" "knight" board_sz "-SAT",
            "grid" grid_a "-" grid_b,
            "knight" board_sz;
    print "grid" grid_a "-" (grid_b + 1) "-" "knight" board_sz "-UNSAT",
            "grid" grid_a "-" (grid_b + 1),
            "knight" board_sz;
  }
}
' < raw-instances.txt | tee instances.txt
