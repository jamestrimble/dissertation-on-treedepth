
import java.util.*;

class Cliquer extends MC {

    int [] c; // weight of max clique using vertices 0 to i inclusive
    int [][] adjacent; // permuted adjacency matrix A
    Vertex[] V;    // mapping index to vertices
    long whenFound;

    Cliquer (int n,int [][] A,int [] degree,int style) {
	super(n,A,degree,style);
	c         = new int[n];
	adjacent  = new int[n][n];
	V         = new Vertex[n];
	whenFound = 0;
    }

    void search(){
	cpuTime  = System.currentTimeMillis();
	nodes    = 0;
	orderVertices();
	for (int i=0;i<n;i++){
	    ArrayList<Integer> P = new ArrayList<Integer>(i+1);
	    ArrayList<Integer> C = new ArrayList<Integer>(i+1);
	    C.add(i);
	    for (int j=0;j<i;j++)
		if (adjacent[i][j] == 1) P.add(j);
	    expand(C,P);
	    c[i] = maxSize;
	    //if (trace) System.out.println("-> "+ i +" "+ c[i] +" "+ V[i].index +" nodes: "+ nodes);
	}
    }

   
    void expand(ArrayList<Integer> C,ArrayList<Integer> P){
	if (timeLimit > 0 && System.currentTimeMillis() - cpuTime >= timeLimit) return;
	nodes++;
	if (P.isEmpty() && C.size() > maxSize){
	    saveSolution(C);
	    return;
	}
	for (int i=P.size()-1;i>=0;i--){
	    if (C.size() + P.size() <= maxSize) return;
	    int v = P.get(i);
	    if (C.size() + c[v] <= maxSize) return;
	    ArrayList<Integer> newP = new ArrayList<Integer>(i);
	    for (int w : P)
		if (adjacent[v][w] == 1) newP.add(w);
	    C.add(v);
	    expand(C,newP);
	    C.remove((Integer)v);
	    P.remove((Integer)v);
	}
    }

     void orderVertices(){
	for (int i=0;i<n;i++){
	    V[i] = new Vertex(i,degree[i]);
	    for (int j=0;j<n;j++) 
		if (A[i][j] == 1) V[i].nebDeg = V[i].nebDeg + degree[j];
	}
        if (style == 1 || style == -1) Arrays.sort(V); 
	if (style == 2 || style == -2) minWidthOrder(V);    
	if (style == 3 || style == -3) Arrays.sort(V,new MCRComparator());
	if (style < 0) reverse(V,0,n-1);
	for (int i=0;i<n;i++)
	    for (int j=0;j<n;j++){
		int u = V[i].index;
		int v = V[j].index;
		adjacent[i][j] = A[u][v];
	    }
     }

    void swap(Vertex[] V,int i,int j){
	Vertex v = V[i];
	V[i] = V[j];
	V[j] = v;
    }
    
    void reverse(Vertex[] V,int low, int high){
	if (low < high){
	    swap(V,low,high);
	    reverse(V,low+1,high-1);
	}
    }
	    

    void saveSolution(ArrayList<Integer> C){
	Arrays.fill(solution,0);
	for (int i : C) solution[V[i].index] = 1;
	maxSize = C.size();
	whenFound = nodes;
	//if (trace) System.out.println(nodes +" "+ maxSize);
    }
}
