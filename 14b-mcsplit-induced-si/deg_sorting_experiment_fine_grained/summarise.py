import math
import sys

n = int(sys.argv[1])

d = {}

def argmin(lst):
    result = 0
    m = lst[0]
    for i in range(1, len(lst)):
        if lst[i] < m:
            m = lst[i]
            result = i
    return result

with open('results/run{}.txt'.format(n), 'r') as f:
    for line in f:
        line = [int(x) for x in line.strip().split()]
        run = tuple(line[:2])
        if run not in d:
            d[run] = [0,0,0,0,0,0,0,0]
        for i in range(8):
            d[run][i] += line[i + 2]

for g in range(0, 101):
    for h in range(0, 101):
        r = d[(g, h)]
        print(g, h, " ".join(str(nodes) for nodes in r))
