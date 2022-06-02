awk '
  BEGIN {at_start_of_group = 1}
  at_start_of_group == 1 {
    k = $1;
    items_len = 0;
    at_start_of_group = 0;
    next;
  }
  NF == 2 {k = $1; items_len = 0}
  NF == 1 {
    items[items_len++] = $1;
  }
  NF == 0 {
    printf("     %s", k);
    sep = " & ";
    for (i=0; i<items_len; i++) {
        item = items[i];
        if (item == "TIMEOUT" || item > 100000) {
            item = "*";
        }
        printf("%s %s", sep, item);
    }
    print("\\\\");
    at_start_of_group = 1;
  }
' < fatanode-results/results.txt | tee fatanode-results/results.tex
