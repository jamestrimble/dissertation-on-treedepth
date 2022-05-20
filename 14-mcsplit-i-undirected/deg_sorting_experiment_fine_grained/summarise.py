import math
import sys

n = int(sys.argv[1])

graphtype = sys.argv[2] if len(sys.argv) > 2 else None

d = {}

def argmin(lst):
    result = 0
    m = lst[0]
    for i in range(1, len(lst)):
        if lst[i] < m:
            m = lst[i]
            result = i
    return result

with open('results{}{}.txt'.format("-" + graphtype if graphtype is not None else "", n), 'r') as f:
    for line in f:
        line = [int(x) for x in line.strip().split()]
        run = tuple(line[:2])
        if run not in d:
            d[run] = [0,0,0,0]
        d[run][0] += line[2]
        d[run][1] += line[3]
        d[run][2] += line[4]
        d[run][3] += line[5]

for g in range(0, 101):
    for h in range(0, 101):
        r = d[(g, h)]
        print(g, h, " ".join(str(nodes) for nodes in r))
