{
    count=$1
    labels=$2
    density=$3
    ntarget=$4
    npattern=$4/5
    for (i=1;i<=count/10;i++) {
        print i, count, labels, density, ntarget, npattern
    }
}
