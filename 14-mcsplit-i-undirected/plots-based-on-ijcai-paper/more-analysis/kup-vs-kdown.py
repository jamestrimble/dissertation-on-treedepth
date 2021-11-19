import struct
import sys
import re

sip_kdown_comparison = False

def read_n(filename, home_dir):
    with open(filename.replace("../../", home_dir + "/OthersCode/"), "rb") as f:
        return struct.unpack("<H", f.read(2))[0]

def read_n_kdown(filename, home_dir):
    with open(filename.replace("../../", home_dir + "/OthersCode/"), "r") as f:
        for line in f:
            return int(line.strip())

def read_sol_size(filename):
    with open(filename, "r") as f:
        for line in f:
            if line.startswith("Solution size"):
                return int(line.strip().split()[2])

def read_sol_size_kdown(filename):
    with open(filename, "r") as f:
        for line in f:
            if line.startswith("EXCEPT="):
                return int(line.strip().split()[-1][5:])
    return -1

def analyse_instance(instance, runtime_kup, runtime_kdown, dataset_name, home_dir):
    if sip_kdown_comparison:
        n0 = read_n_kdown(instance[1], home_dir)
        n1 = read_n_kdown(instance[2], home_dir)
        solsize_kup = read_sol_size_kdown(
                home_dir + "/Code/ijcai2017-partitioning-common-subgraph/experiments/gpgnode-results/{}/kdown/{}.out".format(
                    dataset_name, instance[0]))
    else:
        n0 = read_n(instance[1], home_dir)
        n1 = read_n(instance[2], home_dir)
        solsize_kup = read_sol_size(
                home_dir + "/Code/ijcai2017-partitioning-common-subgraph/experiments/gpgnode-results/{}/james-cpp-max/{}.out".format(
                    dataset_name, instance[0]))
    solsize_kdown = read_sol_size(
            home_dir + "/Code/ijcai2017-partitioning-common-subgraph/experiments/gpgnode-results/{}/james-cpp-max-down/{}.out".format(
                dataset_name, instance[0]))
    if runtime_kup<1000000 and runtime_kdown<1000000 and solsize_kup != solsize_kdown:
        sys.stderr.write("Solution sizes differ between runs!\n")
        sys.exit(1)
    if runtime_kup > 1000000:
        runtime_kup = 1000000
    if runtime_kdown > 1000000:
        runtime_kdown = 1000000
    if runtime_kup < 1000000:
        solsize = solsize_kup
    elif runtime_kdown < 1000000:
        solsize = solsize_kdown
    else:
        return
    print instance[0], n0, n1, runtime_kup, runtime_kdown, solsize, \
            float(solsize) / n0
    
def print_header():
    print "instance", \
            "n_pattern", \
            "n_target", \
            "runtime_kup", \
            "runtime_kdown", \
            "solsize", \
            "solsize_over_n_pattern"

def go(dataset_name, kup_time_column, kdown_time_column, home_dir):
    print_header()
    runtimes = {}
    with open("../experiments/gpgnode-results/{}/runtimes.data".format(dataset_name), "r") as f:
        lines = [line.strip().split() for line in f]
    for tokens in lines[1:]:
        kup_time = int(tokens[kup_time_column])
        kdown_time = int(tokens[kdown_time_column])
        runtimes[tokens[0]] = {"kup":kup_time, "kdown":kdown_time}

    with open("../experiments/{}instances.txt".format(dataset_name), "r") as f:
        instances = [line.strip().split() for line in f]
    for instance in instances:
        runtime = runtimes[instance[0]]
        analyse_instance(instance, runtime["kup"], runtime["kdown"], dataset_name, home_dir)

if __name__=="__main__":
    if len(sys.argv) > 5 and sys.argv[5] == "--sip-kdown":
        sip_kdown_comparison = True
    go(sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), sys.argv[4])
