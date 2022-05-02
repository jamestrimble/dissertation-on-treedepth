import sys

line = sys.stdin.readline()

n = int(line)
m = [[0] * n for _ in range(n)]

for v in range(n):
    line = [int(x) for x in sys.stdin.readline().split()]
    for w in line[1:]:
        m[v][w] = m[w][v] = 1

print(n)
for v in range(n):
    ww = [w for w in range(n) if m[v][w]]
    print(str(len(ww)) + "".join(" " + str(w) for w in ww))
