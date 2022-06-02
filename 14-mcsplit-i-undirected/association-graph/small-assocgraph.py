G_nodes = [1,2,3,4]
H_nodes = "abcd"

G_edges = frozenset(frozenset(e) for e in [[1, 2], [2, 3], [3, 4]])
H_edges = frozenset(frozenset(e) for e in [['a', 'b'], ['b', 'c'], ['c', 'd'], ['d', 'a']])

A_nodes = [(v,w) for v in G_nodes for w in H_nodes]

optimal_solution = [(1,'a'), (2,'b'), (3,'c')]

def edge_anchor(v):
    if v == 1:
        return "east"
    if v == 2:
        return "south"
    if v == 3:
        return "west"
    if v == 4:
        return "north"

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
                        print("\\draw[ultra thick] ({}{}.{}) -- ({}{}.{});".format(
                                v1, w1, edge_anchor(v1), v2, w2, edge_anchor(v2)))
                else:
                    if iter == 'grey':
                        print("\\draw[color=gray, line width=.3] ({}{}.{}) -- ({}{}.{});".format(
                                v1, w1, edge_anchor(v1), v2, w2, edge_anchor(v2)))
        
