import sys

if len(sys.argv) == 1:
    raw_m = []
    g_labels = [0] * 5
    h_labels = [0] * 6
else:
    raw_m = sys.argv[1].split(",")
    g_labels = [l for l in sys.argv[2]]
    h_labels = [l for l in sys.argv[3]]

m = []

for item in raw_m:
    row = int(item[0]) - 1
    col = ord(item[1]) - ord('a')
    m.append((row, col))

grid = [[0] * 6 for _ in range(5)]

for row in range(5):
    for col in range(6):
        if (row, col) in m:
            grid[row][col] = 2
        elif g_labels[row] == "x" or h_labels[col] == "x" or g_labels[row] != h_labels[col]:
            grid[row][col] = 1

for row, col in m:
    grid[row][col] = 2

def symbol(square_val):
    if square_val == 2:
        return "M"
    if square_val == 1:
        return "$\\times$"
    return ""

items = []
for row in range(5):
    for col in range(6):
        items.append("{}/{}/{}".format(col+.5,4.5-row,symbol(grid[row][col])))

print(",".join(items))
