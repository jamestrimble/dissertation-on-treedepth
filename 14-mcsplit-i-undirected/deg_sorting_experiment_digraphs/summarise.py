import math
import sys

d = {}

def argmin(lst):
    result = 0
    m = lst[0]
    for i in range(1, len(lst)):
        if lst[i] < m:
            m = lst[i]
            result = i
    return result

with open('results.txt', 'r') as f:
    for line in f:
        line = [int(x) for x in line.strip().split()]
        run = tuple(line[:2])
        if run not in d:
            d[run] = [0,0,0,0]
        d[run][0] += line[2]
        d[run][1] += line[3]
        d[run][2] += line[4]
        d[run][3] += line[5]

for g in range(5, 105, 10):
    for h in range(5, 105, 10):
        r = d[(g, h)]
        sys.stdout.write(str(argmin(r)) + ' ')
    sys.stdout.write('\n')

print()

for g in range(5, 105, 10):
    for h in range(5, 105, 10):
        r = d[(g, h)]
        for i in range(4):
            sys.stdout.write(str(int(10*math.log(r[i]))).zfill(3) + ' ')
        sys.stdout.write(' ')
    sys.stdout.write('\n\n')

print()

for g in range(5, 105, 10):
    for h in range(5, 105, 10):
        r = d[(g, h)]
        for i in range(4):
            sys.stdout.write(str(int(r[i] / max(r) * 100)).zfill(3) + ' ')
        sys.stdout.write(' ')
    sys.stdout.write('\n\n')

print()

for g in range(5, 105, 10):
    for h in range(5, 105, 10):
        r = d[(g, h)]
        print(g, h, r)
    print
