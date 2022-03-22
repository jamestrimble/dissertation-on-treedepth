import sys

edges = []

for i, line in enumerate(sys.stdin):
    line = [int(x) for x in line.strip().split()]
    if i == 0:
        n = line[0]
        print("#graph")
        print(n)
        for i in range(n):
            print(0) 
    else:
        v = i - 1
        for w in line[1:]:
            edges.append((v, w))

print(len(edges))
for v, w in edges:
    print(v, w)
