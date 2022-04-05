import sys

for i, line in enumerate(sys.stdin):
    if i == 0:
        print(line.strip(), "SAT")
        continue
    line = line.strip().split()
    results = line[1:]
    seen = set()
    sat = "X"
    for result in results:
        if (result == "1" and "0" in seen) or (result == "0" and "1" in seen):
            sys.stderr.write("Disagreement on instance {}!\n".format(line[0]))
            sys.exit(1)
        seen.add(result)
        if result == "0" or result == "1":
            sat = result
    print(" ".join(line), sat)
