from collections import deque
import random
import sys
import time

class Graph(object):
    def __init__(self, adjmat):
        self.n = len(adjmat)
        self.adjmat = adjmat
        self.degree = [sum(row) for row in self.adjmat]

if __name__ == "__main__":
    n = int(sys.argv[1])
    p = float(sys.argv[2])
    n_pattern = n // 5

    adjmat = [[False] * n for _ in range(n)]
    for i in range(n):
        for j in range(n):
            if i!=j and random.random() < p:
                adjmat[i][j] = True

    g = Graph(adjmat)

    subset = [v for v in range(n)]
    random.shuffle(subset)
    subset = subset[:n_pattern]

    num_edges = sum(sum(row) for row in g.adjmat)/2
    with open('tmp/h.csv', 'w') as f:
        for i in range(g.n):
            f.write('{},,1\n'.format(i))
        edges = []
        for i in range(g.n):
            for j in range(g.n):
                if g.adjmat[i][j]:
                    edges.append((i, j))
        for v, w in edges:
            f.write('{}>{}\n'.format(v, w))
    with open('tmp/g.csv', 'w') as f:
        for i in range(n_pattern):
            f.write('{},,1\n'.format(i))
        edges = []
        for i in range(n_pattern):
            for j, v in enumerate(subset):
                if g.adjmat[subset[i]][v]:
                    edges.append((i, j))
        for v, w in edges:
            f.write('{}>{}\n'.format(v, w))

    with open('tmp/h.gfd', 'w') as f:
        f.write('#instance\n')
        f.write('{}\n'.format(n))
        for i in range(g.n):
            f.write('{}\n'.format(0))
        edges = []
        for i in range(g.n):
            for j in range(g.n):
                if g.adjmat[i][j]:
                    edges.append((i, j))
        f.write('{}\n'.format(len(edges)))
        for v, w in edges:
            f.write('{} {}\n'.format(v, w))
    with open('tmp/g.gfd', 'w') as f:
        f.write('#instance\n')
        f.write('{}\n'.format(n_pattern))
        for i in range(n_pattern):
            f.write('{}\n'.format(0))
        edges = []
        for i in range(n_pattern):
            for j, v in enumerate(subset):
                if g.adjmat[subset[i]][v]:
                    edges.append((i, j))
        f.write('{}\n'.format(len(edges)))
        for v, w in edges:
            f.write('{} {}\n'.format(v, w))

    with open('tmp/h.vf3', 'w') as f:
        f.write('{}\n'.format(n))
        for i in range(g.n):
            f.write('{} {}\n'.format(i, 0))
        for i in range(g.n):
            edges = []
            for j in range(g.n):
                if g.adjmat[i][j]:
                    edges.append((i, j))
            f.write('{}\n'.format(len(edges)))
            for v, w in edges:
                f.write('{} {}\n'.format(v, w))
    with open('tmp/g.vf3', 'w') as f:
        f.write('{}\n'.format(n_pattern))
        for i in range(n_pattern):
            f.write('{} {}\n'.format(i, 0))
        for i in range(n_pattern):
            edges = []
            for j, v in enumerate(subset):
                if g.adjmat[subset[i]][v]:
                    edges.append((i, j))
            f.write('{}\n'.format(len(edges)))
            for v, w in edges:
                f.write('{} {}\n'.format(v, w))

    with open('tmp/h.lad', 'w') as f:
        f.write('{}\n'.format(n))
        for i in range(g.n):
            row = []
            for j in range(g.n):
                if g.adjmat[i][j]:
                    row.append(j)
            f.write('{}'.format(len(row)))
            for v in row:
                f.write(' {}'.format(v))
            f.write('\n')
    with open('tmp/g.lad', 'w') as f:
        f.write('{}\n'.format(n_pattern))
        for i in range(n_pattern):
            row = []
            for j, v in enumerate(subset):
                if g.adjmat[subset[i]][v]:
                    row.append(j)
            f.write('{}'.format(len(row)))
            for v in row:
                f.write(' {}'.format(v))
            f.write('\n')
