import sys

raw_queens = sys.argv[1:]

queens = []

for q in raw_queens:
    row = int(q[1]) - 1
    col = ord(q[0]) - ord('A')
    queens.append((row, col))

grid = [[0] * 4 for _ in range(4)]

for row, col in queens:
    for i in range(4):
        grid[row][i] = 1
        grid[i][col] = 1
    r, c = row, col
    while r >= 0 and c >= 0:
        grid[r][c] = 1
        r -= 1
        c -= 1
    r, c = row, col
    while r >= 0 and c < 4:
        grid[r][c] = 1
        r -= 1
        c += 1
    r, c = row, col
    while r < 4 and c >= 0:
        grid[r][c] = 1
        r += 1
        c -= 1
    r, c = row, col
    while r < 4 and c < 4:
        grid[r][c] = 1
        r += 1
        c += 1

for row, col in queens:
    grid[row][col] = 2

def symbol(square_val):
    if square_val == 2:
        return "\\symqueen"
    if square_val == 1:
        return "$\\times$"
    return ""

items = []
for row in range(4):
    for col in range(4):
        items.append("{}/{}/{}".format(col+.5,row+.5,symbol(grid[row][col])))

print(",".join(items))
