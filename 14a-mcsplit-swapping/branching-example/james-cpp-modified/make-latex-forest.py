import sys

b_and_b = False
letters_first = False
highlight_last_subtree=False
for arg in sys.argv[1:]:
    if arg == "--b-and-b":
        b_and_b = True
    if arg == "--letters-first":
        letters_first = True
    if arg == "--highlight-last-subtree":
        highlight_last_subtree = True

lines = [[int(tok) for tok in line.strip().split()[1:]] for line in sys.stdin]
children = {}
bounds = {}
edges = {}
updated_incumbents = {}

if b_and_b:
    for child, parent, bound, edge_a, edge_b, updated_incumbent in lines:
        updated_incumbents[child] = updated_incumbent
        bounds[child] = bound
        edges[child] = (edge_a, edge_b)
        if parent not in children:
            children[parent] = []
        children[parent].append(child)
else:
    for child, parent, bound, edge_a, edge_b in lines:
        updated_incumbents[child] = False
        bounds[child] = bound
        edges[child] = (edge_a, edge_b)
        if parent not in children:
            children[parent] = []
        children[parent].append(child)

def visit_node(n):
    s = '['
    s += str(bounds[n])
    s += ",inner sep=1.5pt"
    edge_a, edge_b = edges[n]
    red = "red," if edge_b == -1 else ""
    if letters_first:
        edge_a = chr(ord('a') + edge_a)
        edge_b = "\\bot" if edge_b == -1 else edge_b + 1
    else:
        edge_a = edge_a + 1
        edge_b = "\\bot" if edge_b == -1 else chr(ord('a') + edge_b)
    node_decoration = "draw,circle," if updated_incumbents[n] else ""
    if highlight_last_subtree and n == children[1][-1]:
        # Highlight subtree rooted at root node's last child
        node_decoration += """tikz={\\node [draw,uofgcobalt,thick,inner sep=0mm,minimum size=5mm,fit to=tree] {};},"""
    s += "{},{}edge label={{node[{}near end,inner sep=1pt,fill=white,font=\scriptsize]{{${}{}$}}}}".format(
            ",s sep=5mm" if n == 1 else "", node_decoration, red, edge_a, edge_b)
    if n in children:
        for child in children[n]:
            s += visit_node(child)
    s += ']'
    return s

print("\\begin{forest}")
print(visit_node(1))
print("\\end{forest}")
