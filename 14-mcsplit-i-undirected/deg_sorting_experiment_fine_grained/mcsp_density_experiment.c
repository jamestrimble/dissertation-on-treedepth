#include "graph.h"

#include <algorithm>
#include <numeric>
#include <chrono>
#include <iostream>
#include <set>
#include <string>
#include <utility>
#include <vector>
#include <mutex>
#include <thread>
#include <condition_variable>
#include <atomic>
#include <random>

#include <unistd.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

using std::vector;
using std::cout;
using std::endl;

static void fail(std::string msg) {
    std::cerr << msg << std::endl;
    exit(1);
}

enum Heuristic { min_max, min_product, min_right, min_min };

/*******************************************************************************
                             Command-line arguments
*******************************************************************************/

//static char doc[] = "Find a maximum clique in a graph in DIMACS format\vHEURISTIC can be min_max or min_product";
//static char args_doc[] = "HEURISTIC FILENAME1 FILENAME2";
//static struct argp_option options[] = {
//    {"fancy-branching", 'f', 0, 0, "Branch on both sides"},
//    {"naive-bound", 'n', 0, 0, "Use a worse bound"},
//    {"quiet", 'q', 0, 0, "Quiet output"},
//    {"verbose", 'v', 0, 0, "Verbose output"},
//    {"dimacs", 'd', 0, 0, "Read DIMACS format"},
//    {"lad", 'l', 0, 0, "Read LAD format"},
//    {"connected", 'c', 0, 0, "Solve max common CONNECTED subgraph problem"},
//    {"directed", 'i', 0, 0, "Use directed graphs"},
//    {"labelled", 'a', 0, 0, "Use edge and vertex labels"},
//    {"vertex-labelled-only", 'x', 0, 0, "Use vertex labels, but not edge labels"},
//    {"big-first", 'b', 0, 0, "First try to find an induced subgraph isomorphism, then decrement the target size"},
//    {"timeout", 't', "timeout", 0, "Specify a timeout (seconds)"},
//    { 0 }
//};

static struct {
    bool which_swap;  // print whether SD and SO swap graphs, then exit
    bool no_sort;
    bool Order_smart_swapped_graphs;
    bool Smart_swapped_graphs;
    bool swapped_graphs;
    bool right_branching;
    bool any_kind_of_fancy_branching;
    bool fancy_branching;
    bool Fancy_branching;
    bool Random_Fancy_branching;
    bool naive_bound;
    bool quiet;
    bool verbose;
    bool dimacs;
    bool lad;
    bool connected;
    bool directed;
    bool edge_labelled;
    bool vertex_labelled;
    bool big_first;
    Heuristic heuristic;
    char *filename1;
    char *filename2;
    int graph_num_vertices;
    int seed;
    int timeout;
    int G_sort_order;
    int H_sort_order;
    int arg_num;
} arguments;

static std::atomic<bool> abort_due_to_timeout;

void set_default_arguments() {
    arguments.quiet = false;
    arguments.verbose = false;
    arguments.dimacs = false;
    arguments.lad = false;
    arguments.connected = false;
    arguments.directed = false;
    arguments.edge_labelled = false;
    arguments.vertex_labelled = false;
    arguments.big_first = false;
    arguments.filename1 = NULL;
    arguments.filename2 = NULL;
    arguments.timeout = 0;
    arguments.arg_num = 0;
    // Sort orders:
    //   0: automatic based on density of other graph
    //   1: small degree first
    //   2: big degree first
    arguments.G_sort_order = 0;
    arguments.H_sort_order = 0;
}

static void parse_opts(int argc, char** argv) {
    int opt;
    while ((opt = getopt(argc, argv, "G:H:wyOSsrfFRnqvdlciaxbt:")) != -1) {
        switch (opt) {
        case 'd':
            if (arguments.lad)
                fail("The -d and -l options cannot be used together.\n");
            arguments.dimacs = true;
            break;
        case 'l':
            if (arguments.dimacs)
                fail("The -d and -l options cannot be used together.\n");
            arguments.lad = true;
            break;
        case 'w':
            arguments.which_swap = true;
            break;
        case 'y':
            arguments.no_sort = true;
            break;
        case 'O':
            arguments.Order_smart_swapped_graphs = true;
            break;
        case 'S':
            arguments.Smart_swapped_graphs = true;
            break;
        case 's':
            arguments.swapped_graphs = true;
            break;
        case 'r':
            arguments.right_branching = true;
            break;
        case 'f':
            arguments.any_kind_of_fancy_branching = true;
            arguments.fancy_branching = true;
            break;
        case 'F':
            arguments.any_kind_of_fancy_branching = true;
            arguments.Fancy_branching = true;
            break;
        case 'R':
            arguments.any_kind_of_fancy_branching = true;
            arguments.Fancy_branching = true;
            arguments.Random_Fancy_branching = true;
            break;
        case 'n':
            arguments.naive_bound = true;
            break;
        case 'q':
            arguments.quiet = true;
            break;
        case 'v':
            arguments.verbose = true;
            break;
        case 'c':
            if (arguments.directed)
                fail("The connected and directed options can't be used together.");
            arguments.connected = true;
            break;
        case 'i':
            if (arguments.connected)
                fail("The connected and directed options can't be used together.");
            arguments.directed = true;
            break;
        case 'a':
            if (arguments.vertex_labelled)
                fail("The -a and -x options can't be used together.");
            arguments.edge_labelled = true;
            arguments.vertex_labelled = true;
            break;
        case 'x':
            if (arguments.edge_labelled)
                fail("The -a and -x options can't be used together.");
            arguments.vertex_labelled = true;
            break;
        case 'b':
            arguments.big_first = true;
            break;
        case 't':
            arguments.timeout = std::stoi(optarg);
            break;
        case 'G':
            arguments.G_sort_order = std::stoi(optarg);
            break;
        case 'H':
            arguments.H_sort_order = std::stoi(optarg);
            break;
        }

    }
    char *arg = argv[optind];
    if (std::string(arg) == "min_max")
        arguments.heuristic = min_max;
    else if (std::string(arg) == "min_product")
        arguments.heuristic = min_product;
    else if (std::string(arg) == "min_right")
        arguments.heuristic = min_right;
    else if (std::string(arg) == "min_min")
        arguments.heuristic = min_min;
    else
        fail("Unknown heuristic (try min_max or min_product)");

    arg = argv[optind + 1];
    arguments.graph_num_vertices = std::stoi(arg);
    arg = argv[optind + 2];
    arguments.seed = std::stoi(arg);
//    arg = argv[optind + 1];
//    arguments.filename1 = arg;
//
//    arg = argv[optind + 2];
//    arguments.filename2 = arg;
}

/*******************************************************************************
                                     RNG
*******************************************************************************/

std::mt19937 rng(1);
std::uniform_real_distribution<double> distribution01(0.0, 1.0);

/*******************************************************************************
                                     Stats
*******************************************************************************/

unsigned long long nodes{ 0 };
unsigned long long nodes_x{ 0 };  // number of nodes in subtree rooted at last child of root node

/*******************************************************************************
                                 MCS functions
*******************************************************************************/

struct VtxPair {
    int v;
    int w;
    VtxPair(int v, int w): v(v), w(w) {}
};

struct Bidomain {
    int l,        r;        // start indices of left and right sets
    int left_len, right_len;
    bool is_adjacent;
    Bidomain(int l, int r, int left_len, int right_len, bool is_adjacent):
            l(l),
            r(r),
            left_len (left_len),
            right_len (right_len),
            is_adjacent (is_adjacent) { };
};

void show(const vector<VtxPair>& current, const vector<Bidomain> &domains,
        const vector<int>& left, const vector<int>& right)
{
    cout << "Nodes: " << nodes << std::endl;
    cout << "Length of current assignment: " << current.size() << std::endl;
    cout << "Current assignment:";
    for (unsigned int i=0; i<current.size(); i++) {
        cout << "  (" << current[i].v << " -> " << current[i].w << ")";
    }
    cout << std::endl;
    for (unsigned int i=0; i<domains.size(); i++) {
        struct Bidomain bd = domains[i];
        cout << "Left  ";
        for (int j=0; j<bd.left_len; j++)
            cout << left[bd.l + j] << " ";
        cout << std::endl;
        cout << "Right  ";
        for (int j=0; j<bd.right_len; j++)
            cout << right[bd.r + j] << " ";
        cout << std::endl;
    }
    cout << "\n" << std::endl;
}

bool check_sol(const Graph & g0, const Graph & g1 , const vector<VtxPair> & solution) {
    return true;
    vector<bool> used_left(g0.n, false);
    vector<bool> used_right(g1.n, false);
    for (unsigned int i=0; i<solution.size(); i++) {
        struct VtxPair p0 = solution[i];
        if (used_left[p0.v] || used_right[p0.w])
            return false;
        used_left[p0.v] = true;
        used_right[p0.w] = true;
        if (g0.label[p0.v] != g1.label[p0.w])
            return false;
        for (unsigned int j=i+1; j<solution.size(); j++) {
            struct VtxPair p1 = solution[j];
            if (g0.adjmat[p0.v][p1.v] != g1.adjmat[p0.w][p1.w])
                return false;
        }
    }
    return true;
}

int calc_bound(const vector<Bidomain>& domains) {
    int bound = 0;
    if (arguments.naive_bound) {
        for (const Bidomain &bd : domains) {
            bound += bd.right_len;
        }
    } else {
        for (const Bidomain &bd : domains) {
            bound += std::min(bd.left_len, bd.right_len);
        }
    }
    return bound;
}

int find_min_value(const vector<int>& arr, int start_idx, int len) {
    int min_v = INT_MAX;
    for (int i=0; i<len; i++)
        if (arr[start_idx + i] < min_v)
            min_v = arr[start_idx + i];
    return min_v;
}

int select_bidomain(const vector<Bidomain>& domains, const vector<int> & left,
        int current_matching_size)
{
    // Select the bidomain with the smallest max(leftsize, rightsize), breaking
    // ties on the smallest vertex index in the left set
    int min_size = INT_MAX;
    int min_tie_breaker = INT_MAX;
    int best = -1;
    for (unsigned int i=0; i<domains.size(); i++) {
        const Bidomain &bd = domains[i];
        if (arguments.connected && current_matching_size>0 && !bd.is_adjacent) continue;
        int len = 0;
        switch (arguments.heuristic) {
        case min_max:
            len = std::max(bd.left_len, bd.right_len);
            break;
        case min_product:
            len = bd.left_len * bd.right_len;
            break;
        case min_right:
            len = bd.right_len;
            break;
        case min_min:
            len = std::min(bd.left_len, bd.right_len) * 10000 + std::max(bd.left_len, bd.right_len);
            break;
        }
        if (len < min_size) {
            min_size = len;
            min_tie_breaker = find_min_value(left, bd.l, bd.left_len);
            best = i;
        } else if (len == min_size) {
            int tie_breaker = find_min_value(left, bd.l, bd.left_len);
            if (tie_breaker < min_tie_breaker) {
                min_tie_breaker = tie_breaker;
                best = i;
            }
        }
    }
    return best;
}

// Returns length of left half of array
int partition(vector<int>& all_vv, int start, int len, const vector<unsigned int> & adjrow) {
    int i=0;
    for (int j=0; j<len; j++) {
        if (adjrow[all_vv[start+j]]) {
            std::swap(all_vv[start+i], all_vv[start+j]);
            i++;
        }
    }
    return i;
}

// multiway is for directed and/or labelled graphs
vector<Bidomain> filter_domains(const vector<Bidomain> & d, vector<int> & left,
        vector<int> & right, const Graph & g0, const Graph & g1, int v, int w,
        bool multiway)
{
    vector<Bidomain> new_d;
    new_d.reserve(d.size());
    for (const Bidomain &old_bd : d) {
        int l = old_bd.l;
        int r = old_bd.r;
        // After these two partitions, left_len and right_len are the lengths of the
        // arrays of vertices with edges from v or w (int the directed case, edges
        // either from or to v or w)
        int left_len = partition(left, l, old_bd.left_len, g0.adjmat[v]);
        int right_len = partition(right, r, old_bd.right_len, g1.adjmat[w]);
        int left_len_noedge = old_bd.left_len - left_len;
        int right_len_noedge = old_bd.right_len - right_len;
        if (left_len_noedge && right_len_noedge)
            new_d.push_back({l+left_len, r+right_len, left_len_noedge, right_len_noedge, old_bd.is_adjacent});
        if (multiway && left_len && right_len) {
            auto& adjrow_v = g0.adjmat[v];
            auto& adjrow_w = g1.adjmat[w];
            auto l_begin = std::begin(left) + l;
            auto r_begin = std::begin(right) + r;
            std::sort(l_begin, l_begin+left_len, [&](int a, int b)
                    { return adjrow_v[a] < adjrow_v[b]; });
            std::sort(r_begin, r_begin+right_len, [&](int a, int b)
                    { return adjrow_w[a] < adjrow_w[b]; });
            int l_top = l + left_len;
            int r_top = r + right_len;
            while (l<l_top && r<r_top) {
                unsigned int left_label = adjrow_v[left[l]];
                unsigned int right_label = adjrow_w[right[r]];
                if (left_label < right_label) {
                    l++;
                } else if (left_label > right_label) {
                    r++;
                } else {
                    int lmin = l;
                    int rmin = r;
                    do { l++; } while (l<l_top && adjrow_v[left[l]]==left_label);
                    do { r++; } while (r<r_top && adjrow_w[right[r]]==left_label);
                    new_d.push_back({lmin, rmin, l-lmin, r-rmin, true});
                }
            }
        } else if (left_len && right_len) {
            new_d.push_back({l, r, left_len, right_len, true});
        }
    }
    return new_d;
}

// returns the index of the smallest value in arr that is >w.
// Assumption: such a value exists
// Assumption: arr contains no duplicates
// Assumption: arr has no values==INT_MAX
int index_of_next_smallest(const vector<int>& arr, int start_idx, int len, int w) {
    int idx = -1;
    int smallest = INT_MAX;
    for (int i=0; i<len; i++) {
        if (arr[start_idx + i]>w && arr[start_idx + i]<smallest) {
            smallest = arr[start_idx + i];
            idx = i;
        }
    }
    return idx;
}

void remove_vtx_from_left_domain(vector<int>& left, Bidomain& bd, int v)
{
    int i = 0;
    while(left[bd.l + i] != v) i++;
    std::swap(left[bd.l+i], left[bd.l+bd.left_len-1]);
    bd.left_len--;
}

void remove_vtx_from_right_domain(vector<int>& right, Bidomain& bd, int v)
{
    int i = 0;
    while(right[bd.r + i] != v) i++;
    std::swap(right[bd.r+i], right[bd.r+bd.right_len-1]);
    bd.right_len--;
}

void remove_bidomain(vector<Bidomain>& domains, int idx) {
    domains[idx] = domains[domains.size()-1];
    domains.pop_back();
}

void solve(const Graph & g0, const Graph & g1, vector<VtxPair> & incumbent,
        vector<VtxPair> & current, vector<Bidomain> & domains,
        vector<int> & left, vector<int> & right, unsigned int matching_size_goal,
        bool is_root_node)
{
    if (abort_due_to_timeout)
        return;

    if (arguments.verbose) show(current, domains, left, right);
    nodes++;

    if (current.size() > incumbent.size()) {
        incumbent = current;
    }

    unsigned int bound = current.size() + calc_bound(domains);
    if (bound <= incumbent.size() || bound < matching_size_goal)
        return;

    if (arguments.big_first && incumbent.size()==matching_size_goal)
        return;

    int bd_idx = select_bidomain(domains, left, current.size());
    if (bd_idx == -1)   // In the MCCS case, there may be nothing we can branch on
        return;
    Bidomain &bd = domains[bd_idx];

    bool branch_on_right = arguments.right_branching;
    if (arguments.any_kind_of_fancy_branching) {
        if (arguments.fancy_branching) {
            if (bd.left_len <= bd.right_len) branch_on_right = true;
        } else if (arguments.Fancy_branching) {
            if (bd.left_len > bd.right_len) branch_on_right = true;
        } else if (arguments.Random_Fancy_branching) {
            if (bd.left_len > bd.right_len || (bd.left_len == bd.right_len && distribution01(rng) < .5)) {
                branch_on_right = true;
            }
        }
    }

    if (branch_on_right) {
        int v = find_min_value(right, bd.r, bd.right_len);
        remove_vtx_from_right_domain(right, domains[bd_idx], v);

        int w = -1;
        bd.left_len--;
        for (int i=0; i<=bd.left_len; i++) {
            int idx = index_of_next_smallest(left, bd.l, bd.left_len+1, w);
            w = left[bd.l + idx];

            // swap w to the end of its colour class
            left[bd.l + idx] = left[bd.l + bd.left_len];
            left[bd.l + bd.left_len] = w;

            auto new_domains = filter_domains(domains, left, right, g0, g1, w, v,
                    arguments.directed || arguments.edge_labelled);
            current.push_back(VtxPair(w, v));
            solve(g0, g1, incumbent, current, new_domains, left, right, matching_size_goal, false);
            current.pop_back();
        }
        bd.left_len++;
        if (bd.right_len == 0)
            remove_bidomain(domains, bd_idx);
    } else {
        int v = find_min_value(left, bd.l, bd.left_len);
        remove_vtx_from_left_domain(left, domains[bd_idx], v);

        // Try assigning v to each vertex w in the colour class beginning at bd.r, in turn
        int w = -1;
        bd.right_len--;
        for (int i=0; i<=bd.right_len; i++) {
            int idx = index_of_next_smallest(right, bd.r, bd.right_len+1, w);
            w = right[bd.r + idx];

            // swap w to the end of its colour class
            right[bd.r + idx] = right[bd.r + bd.right_len];
            right[bd.r + bd.right_len] = w;

            auto new_domains = filter_domains(domains, left, right, g0, g1, v, w,
                    arguments.directed || arguments.edge_labelled);
            current.push_back(VtxPair(v, w));
            solve(g0, g1, incumbent, current, new_domains, left, right, matching_size_goal, false);
            current.pop_back();
        }
        bd.right_len++;
        if (bd.left_len == 0)
            remove_bidomain(domains, bd_idx);
    }
    unsigned long long nodes_before = nodes;
    solve(g0, g1, incumbent, current, domains, left, right, matching_size_goal, false);
    if (is_root_node) {
        nodes_x += nodes - nodes_before;
    }
}

vector<VtxPair> mcs(const Graph & g0, const Graph & g1) {
    vector<int> left;  // the buffer of vertex indices for the left partitions
    vector<int> right;  // the buffer of vertex indices for the right partitions

    auto domains = vector<Bidomain> {};

    std::set<unsigned int> left_labels;
    std::set<unsigned int> right_labels;
    for (unsigned int label : g0.label) left_labels.insert(label);
    for (unsigned int label : g1.label) right_labels.insert(label);
    std::set<unsigned int> labels;  // labels that appear in both graphs
    std::set_intersection(std::begin(left_labels),
                          std::end(left_labels),
                          std::begin(right_labels),
                          std::end(right_labels),
                          std::inserter(labels, std::begin(labels)));

    // Create a bidomain for each label that appears in both graphs
    for (unsigned int label : labels) {
        int start_l = left.size();
        int start_r = right.size();

        for (int i=0; i<g0.n; i++)
            if (g0.label[i]==label)
                left.push_back(i);
        for (int i=0; i<g1.n; i++)
            if (g1.label[i]==label)
                right.push_back(i);

        int left_len = left.size() - start_l;
        int right_len = right.size() - start_r;
        domains.push_back({start_l, start_r, left_len, right_len, false});
    }

    vector<VtxPair> incumbent;

    if (arguments.big_first) {
        for (int k=0; k<g0.n; k++) {
            unsigned int goal = g0.n - k;
            auto left_copy = left;
            auto right_copy = right;
            auto domains_copy = domains;
            vector<VtxPair> current;
            solve(g0, g1, incumbent, current, domains_copy, left_copy, right_copy, goal, true);
            if (incumbent.size() == goal || abort_due_to_timeout) break;
            if (!arguments.quiet) cout << "Upper bound: " << goal-1 << std::endl;
        }

    } else {
        vector<VtxPair> current;
        solve(g0, g1, incumbent, current, domains, left, right, 1, true);
    }

    return incumbent;
}

vector<int> calculate_degrees(const Graph & g) {
    vector<int> degree(g.n, 0);
    for (int v=0; v<g.n; v++) {
        for (int w=0; w<g.n; w++) {
            unsigned int mask = 0xFFFFu;
            if (g.adjmat[v][w] & mask) degree[v]++;
            if (g.adjmat[v][w] & ~mask) degree[v]++;  // inward edge, in directed case
        }
    }
    return degree;
}

int sum(const vector<int> & vec) {
    return std::accumulate(std::begin(vec), std::end(vec), 0);
}

double density(const Graph & g, const vector<int> & g_deg)
{
    if (arguments.directed)
        return (double) sum(g_deg) / (g.n*(g.n-1)*2);
    else
        return (double) sum(g_deg) / (g.n*(g.n-1));
}

int main(int argc, char** argv) {
    set_default_arguments();
    parse_opts(argc, argv);

    std::thread timeout_thread;
    std::mutex timeout_mutex;
    std::condition_variable timeout_cv;
    abort_due_to_timeout.store(false);
    bool aborted = false;

    if (0 != arguments.timeout) {
        timeout_thread = std::thread([&] {
                auto abort_time = std::chrono::steady_clock::now() + std::chrono::seconds(arguments.timeout);
                {
                    /* Sleep until either we've reached the time limit,
                     * or we've finished all the work. */
                    std::unique_lock<std::mutex> guard(timeout_mutex);
                    while (! abort_due_to_timeout.load()) {
                        if (std::cv_status::timeout == timeout_cv.wait_until(guard, abort_time)) {
                            /* We've woken up, and it's due to a timeout. */
                            aborted = true;
                            break;
                        }
                    }
                }
                abort_due_to_timeout.store(true);
                });
    }

    std::mt19937 generator(arguments.seed);
    std::uniform_real_distribution<double> dis(0.0, 100.0);
    std::uniform_int_distribution<int> edge_dis(1, 5);

    for (int p=0; p<=100; p++) {
        for (int q=0; q<=100; q++) {
            std::cout << p << " " << q;
            Graph g0(arguments.graph_num_vertices);
            Graph g1(arguments.graph_num_vertices);
            if (arguments.directed) {
                for (int i=0; i<arguments.graph_num_vertices; i++) {
                    for (int j=0; j<arguments.graph_num_vertices; j++) {
                        if (i == j) continue;
                        if (dis(generator) < p) add_edge(g0, i, j, true,
                                arguments.edge_labelled ? edge_dis(generator) : 1);
                        if (dis(generator) < q) add_edge(g1, i, j, true,
                                arguments.edge_labelled ? edge_dis(generator) : 1);
                    }
                }
            } else {
                for (int i=0; i<arguments.graph_num_vertices; i++) {
                    for (int j=0; j<i; j++) {
                        if (dis(generator) < p) add_edge(g0, i, j, false,
                                arguments.edge_labelled ? edge_dis(generator) : 1);
                        if (dis(generator) < q) add_edge(g1, i, j, false,
                                arguments.edge_labelled ? edge_dis(generator) : 1);
                    }
                }
            }

            for (int run=0; run<4; run++) {
                if (run == 0) {
                    arguments.G_sort_order = 1;
                    arguments.H_sort_order = 1;
                } else if (run == 1) {
                    arguments.G_sort_order = 1;
                    arguments.H_sort_order = 2;
                } else if (run == 2) {
                    arguments.G_sort_order = 2;
                    arguments.H_sort_order = 1;
                } else if (run == 3) {
                    arguments.G_sort_order = 2;
                    arguments.H_sort_order = 2;
                }
                nodes = 0;

                vector<int> g0_deg = calculate_degrees(g0);
                vector<int> g1_deg = calculate_degrees(g1);

                double g0_density = density(g0, g0_deg);
                double g1_density = density(g1, g1_deg);

                if (arguments.which_swap) {
                    if ((g0_density < g1_density && g0_density < 1 - g1_density) ||
                        (g0_density > g1_density && g0_density > 1 - g1_density)) {
                        std::cout << "density-swap ";
                    } else {
                        std::cout << "density-no-swap ";
                    }
                    if (g0.n > g1.n) {
                        std::cout << "order-swap";
                    } else {
                        std::cout << "order-no-swap";
                    }
                    std::cout << std::endl;
                    exit(0);
                }
                if (arguments.Smart_swapped_graphs &&
                        ((g0_density < g1_density && g0_density < 1 - g1_density) ||
                        (g0_density > g1_density && g0_density > 1 - g1_density))
                    ) {
                    std::swap(g0, g1);
                    std::swap(g0_deg, g1_deg);
                    std::swap(g0_density, g1_density);
                }
                
                if (arguments.Order_smart_swapped_graphs && g0.n > g1.n) {
                    std::swap(g0, g1);
                    std::swap(g0_deg, g1_deg);
                    std::swap(g0_density, g1_density);
                }
                

                // Note: this version uses different definitions of g0_dense and g1_dense than
                // the IJCAI 2017 paper.
                vector<int> vv0(g0.n);
                std::iota(std::begin(vv0), std::end(vv0), 0);
                bool g0_small_deg_first;
                if (arguments.G_sort_order == 0) {
                    g0_small_deg_first = density(g1, g1_deg) > .5;
                } else if (arguments.G_sort_order == 1) {
                    g0_small_deg_first = true;
                } else {
                    g0_small_deg_first = false;
                }
                if (!arguments.no_sort) {
                    std::stable_sort(std::begin(vv0), std::end(vv0), [&](int a, int b) {
                        return g0_small_deg_first ? (g0_deg[a]<g0_deg[b]) : (g0_deg[a]>g0_deg[b]);
                    });
                }
                vector<int> vv1(g1.n);
                std::iota(std::begin(vv1), std::end(vv1), 0);
                bool g1_small_deg_first;
                if (arguments.H_sort_order == 0) {
                    g1_small_deg_first = density(g0, g0_deg) > .5;
                } else if (arguments.H_sort_order == 1) {
                    g1_small_deg_first = true;
                } else {
                    g1_small_deg_first = false;
                }
                if (!arguments.no_sort) {
                    std::stable_sort(std::begin(vv1), std::end(vv1), [&](int a, int b) {
                        return g1_small_deg_first ? (g1_deg[a]<g1_deg[b]) : (g1_deg[a]>g1_deg[b]);
                    });
                }

                struct Graph g0_sorted = induced_subgraph(g0, vv0);
                struct Graph g1_sorted = induced_subgraph(g1, vv1);

                mcs(g0_sorted, g1_sorted);
                std::cout << " " << nodes;
            }
            std::cout << endl;
        }
    }
}
