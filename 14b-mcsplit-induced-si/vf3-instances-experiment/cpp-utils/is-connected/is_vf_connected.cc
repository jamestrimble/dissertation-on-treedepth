/* vim: set sw=4 sts=4 et foldmethod=syntax : */

#include <algorithm>
#include <cstdlib>
#include <exception>
#include <iostream>
#include <numeric>
#include <string>
#include <vector>

using std::accumulate;
using std::cerr;
using std::cin;
using std::cout;
using std::endl;
using std::exception;
using std::istream;
using std::string;
using std::vector;

class GraphFileError :
    public exception
{
    private:
        string _what;

    public:
        GraphFileError(const string & filename, const string & message) throw ();

        auto what() const throw () -> const char *;
};

GraphFileError::GraphFileError(const string & filename, const string & message) throw () :
    _what("Error reading graph file '" + filename + "': " + message)
{
}

auto GraphFileError::what() const throw () -> const char *
{
    return _what.c_str();
}

namespace
{
    auto read_word(istream & infile) -> int
    {
        int x;
        infile >> x;
        return x;
    }
}

auto main(int, char * argv[]) -> int
{
    try {
        int size = read_word(cin);
        if (! cin)
            throw GraphFileError{ "stdin", "error reading size" };

        for (int r = 0 ; r < size ; ++r) {
            read_word(cin);
            read_word(cin);
        }

        vector<vector<int> > adj(size);

        for (int r = 0 ; r < size ; ++r) {
            int c_end = read_word(cin);
            if (! cin)
                throw GraphFileError{ "stdin", "error reading edges count" };

            for (int c = 0 ; c < c_end ; ++c) {
                int u = read_word(cin);
                if (u < 0 || u >= size)
                    throw GraphFileError{ "stdin", "edge index out of bounds" };

                int v = read_word(cin);
                if (v < 0 || v >= size)
                    throw GraphFileError{ "stdin", "edge index out of bounds" };

                adj[u].push_back(v);
                adj[v].push_back(u);
            }
        }

        string rest;
        if (cin >> rest)
            throw GraphFileError{ "stdin", "EOF not reached, next text is \"" + rest + "\"" };
        if (! cin.eof())
            throw GraphFileError{ "stdin", "EOF not reached" };

        vector<bool> seen(size);
        vector<int> to_visit {0};
        seen[0] = true;
        while(!to_visit.empty()) {
            int v = to_visit.back();
            to_visit.pop_back();
            for (int u : adj[v]) {
                if (!seen[u]) {
                    to_visit.push_back(u);
                    seen[u] = true;
                }
            }
        }
        
        for (int i=0; i<size; i++) {
            if (!seen[i]) {
                std::cout << "Disconnected" << std::endl;
                return 9;
            }
        }

        std::cout << "Connected" << std::endl;
        return EXIT_SUCCESS;
    }
    catch (const GraphFileError & e) {
        cerr << argv[0] << ": error: " << e.what() << endl;
        return EXIT_FAILURE;
    }
}

