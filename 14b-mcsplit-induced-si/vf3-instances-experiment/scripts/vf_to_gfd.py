import sys

filename = sys.argv[1]

with open(filename, 'r') as f:
    n = int(f.readline().strip())
    print('#graph')
    print(n)
    for i in range(n):
        line = [int(x) for x in f.readline().strip().split()]
        print(line[1])
    total_edge_count = 0
    for i in range(n):
        edge_count = int(f.readline().strip())
        total_edge_count += edge_count
        for i in range(edge_count):
            f.readline()
    print(total_edge_count)
    
    f.seek(0)
    for i in range(n + 1):
        f.readline()
    for i in range(n):
        edge_count = int(f.readline().strip())
        for i in range(edge_count):
            print(f.readline().strip())

