family_num_to_name = {
    1: "Scalefree",
    2: "LV",
    11: "LV",
    3: "BVG",
    4: "BVG",
    5: "M4D",
    6: "M4D",
    7: "Rand",
    9: "PR",
    12: "Phase",
    13: "Meshes",
    14: "Images"
}

family_names = ["Scalefree", "LV", "BVG", "M4D", "Rand", "Phase", "PR", "Meshes", "Images"]

families = []
with open('../cpaior2019-sbs-for-subgraphs-paper/experiments/instances.txt', 'r') as f:
    for line in f:
        families.append(int(line.strip().split()[3]))

with open('fatanode-results/runtimes-tidied.txt', 'r') as f:
    for i, line in enumerate(f):
        line = line.strip().split()
        line = [
            line[0],
            line[2],
            line[1],
            line[7],
            line[8],
            line[9],
            line[11],
            line[13]
        ]
        if i == 0:
            programs = line[1:]
            winner_counts = {p: {f: 0 for f in set(family_names)} for p in programs}
            solved_counts = {p: {f: 0 for f in set(family_names)} for p in programs}
            continue
        
        family = family_num_to_name[families[i - 1]]

        times = [int(t) for t in line[1:]]

        assert len(programs) == len(times)

        for p, t in zip(programs, times):
            if t < 1000000:
                solved_counts[p][family] += 1
            if t < 1000000 and t == min(times):
                winner_counts[p][family] += 1

print("family count {}".format(" ".join(programs)))
for f in family_names:
    results = [winner_counts[p][f] for p in programs]
    count = sum(family_num_to_name[f_] == f for f_ in families)
    print("{} {} {}".format(f, count, " ".join(str(c) for c in results)))
results = [sum(winner_counts[p].values()) for p in programs]
count = len(families)
print("{} {} {}".format('TOTAL', count, " ".join(str(c) for c in results)))

print()
print("family count {}".format(" ".join(programs)))
for f in family_names:
    results = [solved_counts[p][f] for p in programs]
    count = sum(family_num_to_name[f_] == f for f_ in families)
    print("{} {} {}".format(f, count, " ".join(str(c) for c in results)))
results = [sum(solved_counts[p].values()) for p in programs]
count = len(families)
print("{} {} {}".format('TOTAL', count, " ".join(str(c) for c in results)))
