## Instances

To get the instances for the large experiment, clone https://github.com/ciaranm/cp2016-max-common-connected-subgraph-paper
as a sibling of the thesis directory.

## Krissinel and Henrick's program

See the private repository github.com/jamestrimble/krissinel

This should be cloned as a sibling to the thesis directory in order to run the experiments.

## mcsplit-modified and mcsplit-modified2

This section has old notes on two programs that were used for the initial mini-experiment on 10 random instances

mcsplit-modified is a version of McSplit that is modified to solve the same problem (enumerate all maximum common subgraphs).  I've removed the initial sorting by degree (as I haven't thought through a sensible way to do this for dense graphs).

mcsplit-modified2 is a version of McSplit that is modified to solve the same problem; it's also modified to try to do roughly the same thing as the program from Krissinel.  Again, the initial sorting by degree is removed.

## new-mcsplit-modified and new-mcsplit-modified2

These are like mcsplit-modified and mcsplit-modified2, but always sort in descending order of degree
