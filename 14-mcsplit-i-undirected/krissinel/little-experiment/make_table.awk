BEGIN {
    print "      G1    G2    G3    G4    G5    G6    G7    G8    G9"
}
/CPU/ {
    res[i++] = $4
    if (i == 9) {
        row++
        printf "%s %5s %5s %5s %5s %5s %5s %5s %5s %5s\n", "G" row, res[0], res[1], res[2], res[3], res[4], res[5], res[6], res[7], res[8], res[9]
        i = 0
    }
}
/time:/ {
    res[i++] = $2
    if (i == 9) {
        row++
        printf "%s %5s %5s %5s %5s %5s %5s %5s %5s %5s\n", "G" row, res[0], res[1], res[2], res[3], res[4], res[5], res[6], res[7], res[8], res[9]
        i = 0
    }
}
