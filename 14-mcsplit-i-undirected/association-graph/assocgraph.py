G_nodes = [1,2,3,4,5]
H_nodes = list("abcdef")

G_edges = frozenset(frozenset(e) for e in [[1, 4], [1, 5], [2, 3], [2, 5], [3, 5]])
H_edges = frozenset(frozenset(e) for e in [['a', 'b'], ['a', 'c'], ['a', 'e'], ['b', 'd'], ['b', 'f'], ['c', 'd'], ['c', 'e'], ['c', 'f'], ['d', 'f'], ['e', 'f']])

A_nodes = [(v,w) for v in G_nodes for w in H_nodes]

optimal_solution = [(1,'a'), (2,'f'), (3,'d'), (5,'b')]

for iter in ['grey', 'black']:
    for i, (v1, w1) in enumerate(A_nodes):
        for j in range(i+1, len(A_nodes)):
            v2, w2 = A_nodes[j]
            if v1 == v2:
                continue
            if w1 == w2:
                continue
            if (frozenset([v1,v2]) in G_edges) == (frozenset([w1,w2]) in H_edges):
                if (v1,w1) in optimal_solution and (v2,w2) in optimal_solution:
                    if iter == 'black':
                        print("\\draw[ultra thick] ({}{}) -- ({}{});".format(v1, w1, v2, w2))
                else:
                    if iter == 'grey':
                        print("\\draw[color=gray, line width=.3] ({}{}) -- ({}{});".format(v1, w1, v2, w2))
        
