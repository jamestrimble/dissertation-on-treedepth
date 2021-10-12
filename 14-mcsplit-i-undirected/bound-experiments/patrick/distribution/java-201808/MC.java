import java.util.*;

public class MC {
    int[] degree;   // degree of vertices
    int[][] A;      // 0/1 adjacency matrix
    int n;          // n vertices
    long nodes;     // number of decisions
    long timeLimit; // milliseconds
    long cpuTime;   // milliseconds
    int maxSize;    // size of max clique
    int style;      // used to flavor algorithm
    int[] solution; // as it says
    boolean trace;

    MC (int n,int[][]A,int[] degree,int style) {
	this.n = n;
	this.A = A;
	this.degree = degree;
	nodes = maxSize = 0;
	cpuTime = timeLimit = -1;
	this.style = style;
	solution = new int[n];
    }

    void search(){
	cpuTime              = System.currentTimeMillis();
	nodes                = 0;
	ArrayList<Integer> C = new ArrayList<Integer>();
	ArrayList<Integer> P = new ArrayList<Integer>(n);
	for (int i=0;i<n;i++) P.add(i);
	orderVertices(P);
	expand(C,P);
    }

    void expand(ArrayList<Integer> C,ArrayList<Integer> P){
	if (timeLimit > 0 && System.currentTimeMillis() - cpuTime >= timeLimit) return;
	nodes++;
	for (int i=P.size()-1;i>=0;i--){
	    if (C.size() + P.size() <= maxSize) return;
	    int v = P.get(i);
	    C.add(v);
	    ArrayList<Integer> newP = new ArrayList<Integer>();
	    for (int w : P) if (A[v][w] == 1) newP.add(w);
	    if (newP.isEmpty() && C.size() > maxSize) saveSolution(C);
	    if (!newP.isEmpty()) expand(C,newP);
	    C.remove((Integer)v);
	    P.remove((Integer)v);
	}
    }

    void saveSolution(ArrayList<Integer> C){
	Arrays.fill(solution,0);
	for (int i : C) solution[i] = 1;
	maxSize = C.size();
    }

    void orderVertices(ArrayList<Integer> VOrd){
	Vertex[] V = new Vertex[n];
	for (int i=0;i<n;i++) V[i] = new Vertex(i,degree[i]);
	for (int i=0;i<n;i++)
	    for (int j=0;j<n;j++) 
		if (A[i][j] == 1) V[i].nebDeg = V[i].nebDeg + degree[j];
	if (style == 1) Arrays.sort(V);
	if (style == 2) minWidthOrder(V);
	if (style == 3) Arrays.sort(V,new MCRComparator());
	for (Vertex v : V) VOrd.add(v.index);
    }
    
    void minWidthOrder(Vertex[] V){
	ArrayList<Vertex> L = new ArrayList<Vertex>(n);
	Stack<Vertex> S = new Stack<Vertex>();
	for (Vertex v : V) L.add(v);
	while (!L.isEmpty()){
	    Vertex v = L.get(0);
	    for (Vertex u : L) if (u.degree < v.degree) v = u;
	    S.push(v); L.remove(v);
	    for (Vertex u : L) if (A[u.index][v.index] == 1) u.degree--;
	}
	int k = 0;
	while (!S.isEmpty()) V[k++] = S.pop();
    }
}
