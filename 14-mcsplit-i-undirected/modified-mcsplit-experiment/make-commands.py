import random
import sys

instancetype = sys.argv[1]
timeout = int(sys.argv[2])

with open("programs.{}.txt".format(instancetype), "r") as f:
    programs = []
    for line in f:
        line = line.strip().split()
        programs.append((line[0], " ".join(line[1:])))

with open("{}.sample.txt".format(instancetype), "r") as f:
    instances = []
    for line in f:
        name, a, b, _ = line.strip().split()
        instances.append((name, a, b))

lines = []
for program_name, program in programs:
    for name, a, b in instances:
        lines.append("{} > program-output/{}/{}.{}.out".format(program.format(timeout, a, b),
                     instancetype, name, program_name))

random.shuffle(lines)

for line in lines:
    print(line)
