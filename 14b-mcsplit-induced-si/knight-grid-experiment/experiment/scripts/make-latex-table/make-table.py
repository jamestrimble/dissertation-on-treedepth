import sys

sat = sys.argv[1]
grid_height = int(sys.argv[2])

print(r"""
\begin{tabular}{ccrrrrrr}
    \toprule
    {$G$} & {$H$} & {McS-SI} & {McS-SI-LL} & {McS-SI-am} & Glasgow & RI-DS & VF3\\ 
    \midrule
""")

def number_with_spaces(n, is_winner):
    if n == 10000000:
        return "*"
    n = str(n)
    result = ""
    while len(n) > 3:
        result = r"\," + n[-3:] + result
        n = n[:-3]
    if is_winner:
        return "$\\underline{" + n + result + "}$"
    else:
        return "$" + n + result + "$"


def nice_number(n):
    if n == "TIMEOUT" or int(n) >= 10000000:
        return 10000000
    return int(n)

with open('fatanode-results/runtimes.txt', 'r') as f:
    for i, line in enumerate(f):
        line = line.strip().split()
        if i == 0:
            continue
        instance = line[0].split("-")
        if instance[3] != sat:
            continue
        if instance[0][4] != str(grid_height):
            continue
        knight_size = instance[2][6:]
        grid = "$P_" + instance[0][4] + "\square P_{" + instance[1] + "}$"
        mcsplit_si_ll = nice_number(line[1])
        mcsplit_si = nice_number(line[2])
        mcsplit_si_adjmat = nice_number(line[6])
        glasgow = nice_number(line[7])
        ri_ds = nice_number(line[10])
        vf3 = nice_number(line[11])
        values = [mcsplit_si, mcsplit_si_ll, mcsplit_si_adjmat, glasgow, ri_ds, vf3]
        if all(item == 0 for item in values):
            continue
        formatted_values = [number_with_spaces(val, val<10000000 and val==min(values)) for val in values]

        table_row = [grid, '$K_{' + knight_size + "}$"] + formatted_values
        print(" & ".join(table_row) + r"\\")
        if all(item == "*" for item in table_row[2:]):
            break


print(r"""
    \bottomrule
\end{tabular}
""")
