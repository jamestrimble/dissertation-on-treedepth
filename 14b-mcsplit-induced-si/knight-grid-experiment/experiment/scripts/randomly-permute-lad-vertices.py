import random
import sys

n = int(sys.stdin.readline().strip())

print(n)

adjmat = [[0] * n for _ in range(n)]

for v in range(n):
    row = [int(token) for token in sys.stdin.readline().strip().split()][1:]
    for w in row:
        adjmat[v][w] = 1
        adjmat[w][v] = 1

order = list(range(n))
random.shuffle(order)

for v in range(n):
    edges = []
    for w in range(v + 1, n):
        if adjmat[order[v]][order[w]]:
            edges.append(w)
    row = [len(edges)] + edges
    print(" ".join(str(x) for x in row))
