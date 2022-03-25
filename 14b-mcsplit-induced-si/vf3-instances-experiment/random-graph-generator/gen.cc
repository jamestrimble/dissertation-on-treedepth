#include <algorithm>
#include <fstream>
#include <iostream>
#include <random>
#include <vector>

int main(int argc, char **argv)
{
    if (argc != 8) {
        std::cerr << "Usage: " << argv[0] << " n_p n_t p num_distinct_labels seed pattern_filename target_filename" << std::endl;
        return 1;
    }
    int n_p = std::stoi(argv[1]);
    int n_t = std::stoi(argv[2]);
    double p = std::stod(argv[3]);
    int num_distinct_labels = std::stoi(argv[4]);
    int seed = std::stoi(argv[5]);
    char *p_filename = argv[6];
    char *t_filename = argv[7];

    std::mt19937 rand;
    rand.seed(seed);

    std::uniform_int_distribution<> label_distrib(0, num_distinct_labels - 1);
    std::uniform_real_distribution<double> dist(0.0, 1.0);

    std::vector<int> t_to_p(n_t, -1);   // target vertex to pattern vertex
    for (unsigned i=0; i<n_p; i++)
        t_to_p[i] = i;
    std::shuffle(t_to_p.begin(), t_to_p.end(), rand);

    std::vector<int> pattern_labels(n_p);
    std::vector<std::vector<int>> pattern_edge_lists(n_p);

    std::ofstream tf(t_filename);
    tf << n_t << "\n";
    for (int i=0; i<n_t; i++) {
        int label = label_distrib(rand);
        tf << i << " " << label << "\n";
        int pattern_v = t_to_p[i];
        if (pattern_v != -1) {
            pattern_labels[pattern_v] = label;
        }
    }
    for (int i=0; i<n_t; i++) {
        std::vector<int> successors;
        int pattern_v = t_to_p[i];
        for (int j=0; j<n_t; j++) {
            if (i == j) continue;
            int pattern_w = t_to_p[j];
            if (dist(rand) < p) {
                successors.push_back(j);
                if (pattern_v != -1 && pattern_w != -1) {
                    pattern_edge_lists[pattern_v].push_back(pattern_w);
                }
            }
        }
        tf << successors.size() << "\n";
        for (int v : successors) {
            tf << i << " " << v << "\n";
        }
    }
    tf.close();
    
    std::ofstream pf(p_filename);
    pf << n_p << "\n";
    for (int i=0; i<n_p; i++) {
        pf << i << " " << pattern_labels[i] << "\n";
    }
    for (int i=0; i<n_p; i++) {
        std::sort(pattern_edge_lists[i].begin(), pattern_edge_lists[i].end());
        pf << pattern_edge_lists[i].size() << "\n";
        for (int j : pattern_edge_lists[i]) {
            pf << i << " " << j << "\n";
        }
    }
    pf.close();
    
    return 0;
}
