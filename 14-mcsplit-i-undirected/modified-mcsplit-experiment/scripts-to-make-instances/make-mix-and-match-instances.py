import random
import sys

n = int(sys.argv[1])

lines = [line.strip().split() for line in sys.stdin]

for i in range(n):
    line1 = random.choice(lines)
    line2 = random.choice(lines)
    # Concatenate instance names, and choose first graph from first instance
    # and second graph from second instance
    print("{}_{} {} {} 0".format(line1[0], line2[0], line1[1], line2[2]))
