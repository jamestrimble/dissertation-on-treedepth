import sys

programs = ["McS-SI", "McS-SI-s", "Gla", "Gla, no supp.", "RI", "VF3"]

print(r"""
\begin{tabular}{lrrrrrr}
    \toprule
""")
print(" & " + " & ".join(programs) + r" \\")
print(r"""
    \midrule
""")

def number_with_spaces(n, is_winner):
    if n == "":
        return ""
    n = str(n)
    result = ""
    while len(n) > 3:
        result = r"\," + n[-3:] + result
        n = n[:-3]
    if is_winner:
        return "$\\underline{" + n + result + "}$"
    else:
        return "$" + n + result + "$"


all_times = []

with open('fatanode-results/runtimes-tidied.txt', 'r') as f:
    for i, line in enumerate(f):
        if i == 0:
            continue
        line = line.strip().split()
        line = [
            line[2],
            line[5],
            line[7],
            line[8],
            line[9],
            line[11]
        ]
        times = [int(t) for t in line]
        all_times.append(times)

for i, pi in enumerate(programs):
    row = [pi]
    for j, pj in enumerate(programs):
        if i == j:
            row.append("")
        else:
            solved_count = 0
            for times in all_times:
                if times[i] < 100 or times[j] < 999900:
                    solved_count += 1
            row.append(solved_count)
    print("\\rule{0pt}{2.3ex}" + pi + " & " + " & ".join(number_with_spaces(n, n != "" and n > 14524) for n in row[1:]) + r" \\")

#for i, line in enumerate(sys.stdin):
#    if i == 0:
#        continue
#    line = [x for x in line.strip().split()]
#    values = [int(x) for x in line[2:]]
#    formatted_values = [number_with_spaces(val, val==max(values)) for val in values]
#    print(" & ".join([line[0], number_with_spaces(line[1], False)] + formatted_values) + r"\\")

print(r"""
    \bottomrule
\end{tabular}
""")
