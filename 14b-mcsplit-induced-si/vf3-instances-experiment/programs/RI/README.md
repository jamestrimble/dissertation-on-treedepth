## James's notes

The decision version is based on Ciaran McCreesh's code.

ORIGINAL README IS BELOW


# RI
***Version: 3.6***
> RI is a general purpose algorithm for one-to-one exact subgraph isomorphism problem maintaining topological constraints. 

<hr />

### Description
***RI*** is a general purpose algorithm for one-to-one exact subgraph isomorphism problem maintaining topological constraints. It is both a C++ library and a standalone tool, providing developing API and a command line interface, with no dependencies out of standard GNU C++ library. RI works on Unix and Mac OS X systems with G++ installed, and it can be compiled under Windows using Gygwin. Working graphs may be directed, undirected, multigraphs with optional attributes both on nodes and edges. Customizable features allow user-defined behaviors for attribute comparisons and the algorithm's flow.


***RI*** aims to provide a better search strategy for the common used backtracking approach to the subgraph isomorphism problem. It can be integrated with additional preprocessing steps or it can be used for the verification of candidate structures coming from data mining, data indexing or other filtering techniques. RI is able to find graphs isomorphisms, subgraph isomorphisms and induced subgraph isomorphisms. It is distributed in several versions divide chiefly in two groups respectively for static or dynamically changing attributes. All proposed versions are developed taking into account trade-offs between time and memory requirements. Optional behaviors such as stop at first encountered match, processing of result matches, type of isomorphism and additional features may be enabled thanks to high modularity and library's API.

The ***RI*** project also aims to provide a comparison of existing exact subgraph matching algorithms on synthetic and real life graphs. An initial collection of datasets is proposed, it includes synthetic and biological graphs but further types of data regarding other research areas (i.e. engineering, computer vision, etc...) are coming. A list of proposed applications is also given.

Please send us an email to get software sources or datasets (see Contacts).

<hr />

### Usage
##### RI - CLI (Command Line Interface)
Before using the RI command line interface of all distributions, please rebuilt it by make -B
All versions of RI take in input the same parameters:
```
 ./ri ISO_TYPE INPUT_FORMAT target_graph pattern_graph    
```
|ISO_TYPE|specify isomorphism|
|---------|-------------------|
|iso|bijective graphs isomorphism.|
|ind|induced subgraph isomorphism|
|mono|monomorphism, the classical subgraph matching|

|INPUT_FORMAT	| specify input file format|
|----------------|-------------------------|
|gfd	|directed graphs with attributes only on nodes.|
|gfu	|undirected graphs with attributes only on nodes.|
|ged	|directed graphs with attributes both on nodes and edges.|
|geu	|undirected graphs with attributes both on nodes and edges.|
|vfu	|Sansone et al. file format for labeled directed graphs with attributes only on nodes.|

##### Query extractor

Before using the query extractor tool please rebuilt it by digiting `make -B querygen`, then the usage of the built executable is the following:
```
./querygen [gfu gfd] input_graph number_of_nodes number_of_edges output_file number_of_queries
```
The query extractor tries to extract a total amount of number_of_queries subgraphs, from the given input_graph, with the specified number_of_nodes and number_of_edges, saving them at the specified output prefix output_file.

You can set the number_of_nodes or number_of_edges to -1 to do not specify them. For example, let the number_of_edges fixed to a value and the number_of_nodes set to the -1, than the extractor tries to extract a subgraph just with the given number of edges not caring the number of nodes. You can also set number_of_nodes to a decimal value between 0 and 1 to specify it as a percentage of the number_of_edges.

Note that if the input parameters do not reflect the properties of the input_graph you can obtain an unwanted resulting subgraph. So, the extractor tries first to generate a graph with the specified number of edges and the maximum possible number of nodes near to the input value. This does not exclude that a subgraph with the specified number of edges will be extracted.


##### FocusSearch-C++
Before use the FocusSearch-C++ command line interface of all distributions, please rebuilt it by make -B
The tool usage is:

```
./fsearch ISO_TYPE INPUT_FORMAT target_graph pattern_graph
```

|ISO_TYPE|specify isomorphism|
|---------------|------------|
|mono|monomorphism, the classical subgraph matching|

|INPUT_FORMAT|	specify input file format|
|---------------|------------|
|gfd	|directed graphs with attributes only on nodes.|
|gfu	|undirected graphs with attributes only on nodes.|
|vfu| Sansone et al. file format for labeled directed graphs with attributes only on nodes.|

##### Default graph file format

The RI project provides two graph file format gfu and gfd, respectively for undirected and directed graphs with attributes only on nodes.

Graphs are stored in text files containing one or more items.
The current input format allows the description of undirect graphs with labels on nodes.
> #[graph_name] <br>
[number of nodes] <br>
[label_of_first_node] <br>
[label_of_second_node] <br>
... <br>
[number of edges] <br>
[node id] [node id] <br>
[node id] [node id] <br>
... <br>

Node ids are assigned following the order in which they are written in the input file, starting from 0.
***[graph_name] and labels can not contain blank characters (spaces).
Labels are case sensitive.***

An example of input file is the following:

> #my_graph <br>
4 <br>
A <br>
B <br>
C <br>
Br <br>
5 <br>
0 1 <br>
2 1 <br>
2 3 <br>
0 3 <br>
0 2 <br>


Indeed, an example of input file in geu format (undirected graph with labels both on nodes and attibutes) is:
> #my_graph <br>
4 <br>
A <br>
B <br>
C <br>
Br <br>
5 <br>
0 1 a <br>
2 1 n<br>
2 3 m<br>
0 3 k<br>
0 2 a<br>

<hr />

### Datasets
A biochemical dataset originally used to evaluate the performance of RI and RI-DS is availiabe at this [repository](https://github.com/GiugnoLab/RI-Datasets).

A further syntetic dataset used to evaluate RI and RI-DS in 2018 is available at the following [repository](https://github.com/GiugnoLab/RI-synthds).

<hr />

### License
RI is distributed under the MIT license. This means that it is free for both academic and commercial use. Note however that some third party components in RI require that you reference certain works in scientific publications.
You are free to link or use RI inside source code of your own program. If do so, please reference (cite) RI and this website. We appreciate bug fixes and would be happy to collaborate for improvements. 
[License](https://raw.githubusercontent.com/GiugnoLab/RI/master/LICENSE)

<hr />

### Citation
     Bonnici, V., Giugno, R., Pulvirenti, A., Shasha, D., & Ferro, A. (2013).
     A subgraph isomorphism algorithm and its application to biochemical data. 
     BMC bioinformatics, 14(7), S13.

     Bonnici V, Giugno R. 
     On the variable ordering in subgraph isomorphism algorithms. 
     IEEE/ACM transactions on computational biology and bioinformatics. 2016 Jan 7;14(1):193-203.
<hr />

### References
 if you have used any of the RI project software, please cite the following paper:
 
Vincenzo Bonnici, Rosalba Giugno, Alfredo Pulvirenti, Dennis Shasha and Alfredo Ferro. A subgraph isomorphism algorithm and its application to biochemical data. BMC Bioinformatics 2013, 14(Suppl 7):S13 doi:10.1186/1471-2105-14-S7-S13.
