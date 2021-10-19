N <- 1:45
x <- 4 * log2(N) - 2 * log2(log2(N)) - 2 * log2(4 / exp(1)) + 1
eps <- 1 / sqrt(4 * log2(N))

lo <- x - eps
hi <- x + eps

lo_floor <- floor(lo)
hi_floor <- floor(hi)

d <- data.frame(N, lo, hi, lo_floor, hi_floor)

write.table(d, "bands.txt", row.names = FALSE)
