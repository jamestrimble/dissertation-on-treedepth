import sys

k = int(sys.argv[1])

def add_edge(adjmat, v, w):
    adjmat[v][w] = 1
    adjmat[w][v] = 1

def write_graph(c, k, filename):
    n = (c + 4) * k
    adjmat = [[0] * n for row in range(n)]
    v = 0
    for i in range(k):
        for j in range(c):
            add_edge(adjmat, v + j, v + ((j + 1) % c))
        add_edge(adjmat, v + c, v + c + 1)
        add_edge(adjmat, v + c, v + c + 2)
        add_edge(adjmat, v + c, v + c + 3)
        v += c + 4
#    for row in adjmat:
#        print(row)
#    print()
    with open(filename, 'w') as f:
        f.write('{}\n'.format(n))
        for v, row in enumerate(adjmat):
            edges = []
            for w, has_edge in enumerate(row):
                if v < w and has_edge:
                    edges.append(w)
            f.write('{} {}\n'.format(len(edges), ' '.join(str(w) for w in edges)))

write_graph(4, k, 'P.lad')
write_graph(5, k, 'T.lad')
