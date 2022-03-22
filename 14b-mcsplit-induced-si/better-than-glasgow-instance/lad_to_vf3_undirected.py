import sys

for i, line in enumerate(sys.stdin):
    line = [int(x) for x in line.strip().split()]
    if i == 0:
        n = line[0]
        print(n)
        for i in range(n):
            print(i, 0) 
    else:
        print(line[0])
        v = i - 1
        for w in line[1:]:
            print(v, w)
