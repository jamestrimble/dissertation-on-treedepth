import random
import sys
import time

if __name__ == "__main__":
    n = int(sys.argv[1])
    p = float(sys.argv[2])
    max_weight = int(sys.argv[3])

    edges = []

    for i in range(n-1):
        for j in range(i+1, n):
            if random.random() < p:
                edges.append((i, j))

    print "p edge {} {}".format(n, len(edges))
    if (max_weight != 1):
        for i in range(n):
            print "n {} {}".format(i+1, random.randint(1, max_weight))
    for i, j in edges:
        print "e {} {}".format(i+1, j+1)
