
import java.util.*;

class MCSCliquer extends Cliquer {

    ArrayList[] colourClass;

    MCSCliquer (int n,int [][] A,int [] degree,int style) {
	super(n,A,degree,style);
    }

    void search(){
	cpuTime     = System.currentTimeMillis();
	nodes       = 0;
	colourClass = new ArrayList[n];
	for (int i=0;i<n;i++) colourClass[i] = new ArrayList<Integer>(n);
	orderVertices();
	for (int i=0;i<n;i++){
	    ArrayList<Integer> P = new ArrayList<Integer>(i+1);
	    ArrayList<Integer> C = new ArrayList<Integer>(i+1);
	    C.add(i);
	    for (int j=0;j<i;j++)
		if (adjacent[i][j] == 1) P.add(j);
	    expand(C,P);
	    c[i] = maxSize;
	}
    }

   
    void expand(ArrayList<Integer> C,ArrayList<Integer> P){
	if (timeLimit > 0 && System.currentTimeMillis() - cpuTime >= timeLimit) return;
	nodes++;
	if (P.isEmpty() && C.size() > maxSize){
	    saveSolution(C);
	    return;
	}
	int[] colourOfVertex = new int[n];
	int[] timesColourUsed = new int[P.size()];
	int colours = colourVertices(P,colourOfVertex,timesColourUsed);
	for (int i=P.size()-1;i>=0;i--){
	    if (C.size() + colours <= maxSize) return;
	    int v = P.get(i);
	    if (C.size() + c[v] <= maxSize) return;
	    int colour = colourOfVertex[v];
	    timesColourUsed[colour]--;
	    if (timesColourUsed[colour] == 0) colours--;
	    ArrayList<Integer> newP = new ArrayList<Integer>(i);
	    for (int w : P)
		if (adjacent[v][w] == 1) newP.add(w);
	    C.add(v);
	    expand(C,newP);
	    C.remove((Integer)v);
	    P.remove((Integer)v);
	}
    }

    int colourVertices(ArrayList<Integer> P,int[] colourOfVertex,int[] timesColourUsed){
	int coloursUsed = 0;
	int m = P.size();
	for (int i=0;i<m;i++) colourClass[i].clear();
	for (int v : P){
	    int k = 0;
	    while (conflicts(v,colourClass[k])) k++;
	    colourClass[k].add(v);
	    colourOfVertex[v] = k;
	    timesColourUsed[k]++;
	    coloursUsed = Math.max(coloursUsed,k+1);
	}
	return coloursUsed;
    }

    boolean conflicts(int v,ArrayList<Integer> colourClass){
	for (int i=0;i<colourClass.size();i++){
	    int w = colourClass.get(i);
	    if (adjacent[v][w] == 1) return true;
	}
	return false;
    }
}
