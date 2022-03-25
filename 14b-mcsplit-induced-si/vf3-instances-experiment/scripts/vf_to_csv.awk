NR == 1 {
    n = $1
}

NR > 1 && NR <= n + 1 {
    print $1 ",," $2
}

NR > n + 1 && NF == 2 {
    print $1 ">" $2
}
