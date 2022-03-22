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

    std::vector<int> pattern_labels(n_p);
    for (unsigned i=0; i<n_p; i++)
        pattern_labels[i] = label_distrib(rand);

    std::vector<int> t_to_p(n_t, -1);   // target vertex to pattern vertex
    for (unsigned i=0; i<n_p; i++)
        t_to_p[i] = i;
    std::shuffle(t_to_p.begin(), t_to_p.end(), rand);

    std::vector<std::vector<bool>> pattern(n_p, std::vector<bool>(n_p));
    std::vector<int> pattern_out_deg(n_p);

    for (unsigned i=0; i<n_p; i++) {
        for (unsigned j=0; j<n_p; j++) {
            if (i == j) continue;
            if (dist(rand) < p) {
                ++pattern_out_deg[i];
                pattern[i][j] = true;
            }
        }
    }

    std::ofstream pf(p_filename);
    pf << n_p << "\n";
    for (int i=0; i<n_p; i++) {
        pf << i << " " << pattern_labels[i] << "\n";
    }
    for (int i=0; i<n_p; i++) {
        pf << pattern_out_deg[i] << "\n";
        for (int j=0; j<n_p; j++) {
            if (pattern[i][j]) {
                pf << i << " " << j << "\n";
            }
        }
    }
    pf.close();
    
    std::ofstream tf(t_filename);
    tf << n_t << "\n";
    for (int i=0; i<n_t; i++) {
        int pattern_v = t_to_p[i];
        int label = pattern_v == -1 ? label_distrib(rand) : pattern_labels[pattern_v];
        tf << i << " " << label << "\n";
    }
    for (int i=0; i<n_t; i++) {
        std::vector<int> successors;
        int pattern_v = t_to_p[i];
        for (int j=0; j<n_t; j++) {
            if (i == j) continue;
            int pattern_w = t_to_p[j];
            if (pattern_v != -1 && pattern_w != -1) {
                if (pattern[pattern_v][pattern_w]) {
                    successors.push_back(j);
                }
            } else if (dist(rand) < p) {
                successors.push_back(j);
            }
        }
        tf << successors.size() << "\n";
        for (int v : successors) {
            tf << i << " " << v << "\n";
        }
    }
    tf.close();
    
    return 0;
}
