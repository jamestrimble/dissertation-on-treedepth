function extremeness(d) {
    e = 0.5 - d;
    return e < 0 ? -e : e;
}

NR == 1 {
    print "e1", "e2", $6, $7
}

NR > 1 {
    print extremeness($3), extremeness($5), $6, $7
}
