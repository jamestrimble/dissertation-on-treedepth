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
        uint16_t size = read_word(cin);
        if (! cin)
            throw GraphFileError{ "stdin", "error reading size" };

        vector<vector<int> > adj;
        adj.resize(size, vector<int>(size));

        for (int r = 0 ; r < size ; ++r) {
            int c_end = read_word(cin);
            if (! cin)
                throw GraphFileError{ "stdin", "error reading edges count" };

            for (int c = 0 ; c < c_end ; ++c) {
                int e = read_word(cin);

                if (e < 0 || e >= size)
                    throw GraphFileError{ "stdin", "edge index out of bounds" };

                adj[r][e] = adj[e][r] = 1;
            }
        }

        string rest;
        if (cin >> rest)
            throw GraphFileError{ "stdin", "EOF not reached, next text is \"" + rest + "\"" };
        if (! cin.eof())
            throw GraphFileError{ "stdin", "EOF not reached" };

        cout << (size + 1) << endl;
        for (int r = 0 ; r < size ; ++r)
            cout << r << " " << (adj[r][r] ? 2 : 1) << endl;

        // Dummy vertex to make the graph connected
        cout << size << " " << 3 << endl;

        for (int r = 0 ; r < size ; ++r) {
            cout << (accumulate(adj[r].begin(), adj[r].end(), 0) - (adj[r][r] ? 1 : 0)) + 1 << endl;
            for (int s = 0 ; s < size ; ++s) {
                if (r != s && adj[r][s]) {
                    cout << r << " " << s << endl;
                }
            }
            cout << r << " " << size << endl;
        }

        // Add edges from dummy vertex
        cout << size << endl;
        for (int s = 0 ; s < size ; ++s) {
            cout << size << " " << s << endl;
        }

        return EXIT_SUCCESS;
    }
    catch (const GraphFileError & e) {
        cerr << argv[0] << ": error: " << e.what() << endl;
        return EXIT_FAILURE;
    }
}

