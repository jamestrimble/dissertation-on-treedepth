import sys

lines = [[int(x) for x in line.strip().split()] for line in sys.stdin]
adj_lines = lines[1:lines[0][0]+1]
edges = set()
for v, line in enumerate(adj_lines):
    for x in line[1:]: 
        if x < v:
            edge = (x,v)
        elif v < x:
            edge = (v,x)
        edges.add(edge)
n = lines[0][0]
print(n, len(edges) / (n*(n-1)/2))
