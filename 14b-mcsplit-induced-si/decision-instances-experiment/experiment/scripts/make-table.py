import sys

print(r"""
\begin{tabular}{crrrrrrrr}
    \toprule
    Family & Count & McS-SI & McS-SI-LL & Gla & Gla, no supp. & RI & VF3 & McS pre.\\
    \midrule
""")

def number_with_spaces(n, is_winner):
    n = str(n)
    result = ""
    while len(n) > 3:
        result = r"\," + n[-3:] + result
        n = n[:-3]
    if is_winner:
        return "$\\underline{" + n + result + "}$"
    else:
        return "$" + n + result + "$"


for i, line in enumerate(sys.stdin):
    if i == 0:
        continue
    line = [x for x in line.strip().split()]
    values = [int(x) for x in line[2:]]
    formatted_values = [number_with_spaces(val, val==max(values)) for val in values]
    print(" & ".join([line[0], number_with_spaces(line[1], False)] + formatted_values) + r"\\")

print(r"""
    \bottomrule
\end{tabular}
""")
