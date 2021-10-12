library(tidyverse)

d <- read.csv("results.csv")
e <- d %>% pivot_wider(names_from=algorithm,values_from=bound)
e$ratio <- e$McSplit / e$MCSa1
e$p <- e$p / 10
e$maxlab_jittered <- e$maxlab + runif(nrow(e), -.1, .1)
write.table(e, "results_pivoted.tsv", sep="\t", row.names=FALSE, quote=FALSE)

f <- e %>%
    group_by(maxlab) %>%
    summarise(mean=mean(ratio))
write.table(f, "results_summary.tsv", sep="\t", row.names=FALSE, quote=FALSE)
