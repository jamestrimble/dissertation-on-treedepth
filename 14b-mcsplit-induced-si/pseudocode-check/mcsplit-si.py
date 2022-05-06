import sys

G_filename = sys.argv[1]
H_filename = sys.argv[2]

def read_graph(filename):
    with open(filename, 'r') as f:
        n = int(f.readline())
        G = [[] for _ in range(n)]
        for v in range(n):
            line = [int(tok) for tok in f.readline().strip().split()[1:]]
            for w in line:
                G[v].append(w)
                G[w].append(v)
    return G

G = read_graph(G_filename)
H = read_graph(H_filename)

search_calls = 0

class LC(object):
    def __init__(self):
        self.prev = None
        self.next = None
        self.start_G = None
        self.end_G = None
        self.start_H = None
        self.end_H = None
        self.active = True
        self.splitting = False

def vtx_score(v):
    return (-len(G[v]), v)

def best_v_in_lc(lc):
    best_score = (99999,99999)
    best_v = -1
    for i in range(lc.start_G[1], lc.end_G[1]):
        v = lc.start_G[0][i]
        score = vtx_score(v)
        if score < best_score:
            best_score = score
            best_v = v
    return best_v

def best_v_and_lc():
    lc = lcs.next
    best_lc_size = 99999
    best_v = -1
    best_lc = None
    while lc != lcs:
        lc_size = lc.end_H[1] - lc.start_H[1]
        if lc_size < best_lc_size:
            best_v = best_v_in_lc(lc)
            best_lc = lc
            best_lc_size = lc_size
        elif lc_size == best_lc_size:
            best_v_in_lc_ = best_v_in_lc(lc)
            if vtx_score(best_v_in_lc_) < vtx_score(best_v):
                best_v = best_v_in_lc_
                best_lc = lc
        lc = lc.next
    return best_v, best_lc

class Ptrs(object):
    def __init__(self, vertexPtr, labelClass):
        self.vertexPtr = vertexPtr
        self.labelClass = labelClass

    def v(self):
        return self.vertexPtr[0][self.vertexPtr[1]]

def show():
    lc = lcs.next
    while lc != lcs:
        print(lc)
        print("Left", lc.start_G[0][lc.start_G[1]:lc.end_G[1]])
        print("Right", lc.start_H[0][lc.start_H[1]:lc.end_H[1]])
        lc = lc.next
    print("Gptrs_v", [p.v() for p in Gptrs])
    print("Hptrs_w", [p.v() for p in Hptrs])
    #print("Gptrs_lc", [p.labelClass for p in Gptrs])
    #print("Hptrs_lc", [p.labelClass for p in Hptrs])
    print("Garr", Garr)
    print("Harr", Harr)
    print()

def search(M):
    global search_calls
    search_calls += 1
    #print(M)
    #show()
    #print("showed")

    if len(M) == len(G):
        print(sorted(M))
        return True

    v, lc = best_v_and_lc()

    ww = lc.start_H[0][lc.start_H[1]:lc.end_H[1]]
    ww.sort(key=lambda w: (-len(H[w]), w))

    #print("ww is", ww)

    for w in ww:
#        print("Before assignment...")
#        show()
#        print("trying", v, w)
        assign(v, w)
#        print("After assignment...")
#        show()
        (splits, deletions, failed) = filter(v, w)
        #print("After filtering...")
        #show()
        #print("failed?", failed)
        if failed:
            success = False
        else:
            success = search(M + [(v, w)])
        unfilter(splits, deletions)
        unassign(v, w, lc)
        if success:
            return True
    return False
    
def mcsplitsi(G, H):
    global lcs
    global Gptrs
    global Hptrs
    global Garr  # global for debugging
    global Harr  # global for debugging
    lcs = LC()
    lc = LC()
    lcs.next = lc
    lcs.prev = lc
    lc.next = lcs
    lc.prev = lcs
    Garr = [v for v in range(len(G))]
    Harr = [v for v in range(len(H))]
    Gptrs = []
    Hptrs = []
    for v in range(len(G)):
        Gptrs.append(Ptrs((Garr,v), lc))
    for v in range(len(H)):
        Hptrs.append(Ptrs((Harr,v), lc))
    lc.start_G = (Garr, 0)
    lc.end_G = (Garr, len(G))
    lc.start_H = (Harr, 0)
    lc.end_H = (Harr, len(H))
    search([])

def assign(v, w):
    lc = Gptrs[v].labelClass
    #print("   ", v, w, lc)

    u = lc.end_G[0][lc.end_G[1] - 1]
    u_ptrs = Gptrs[u]
    v_ptrs = Gptrs[v]
    v_ptrs.vertexPtr[0][v_ptrs.vertexPtr[1]], u_ptrs.vertexPtr[0][u_ptrs.vertexPtr[1]] = \
            u_ptrs.vertexPtr[0][u_ptrs.vertexPtr[1]], v_ptrs.vertexPtr[0][v_ptrs.vertexPtr[1]]
    Gptrs[v].vertexPtr, Gptrs[u].vertexPtr = Gptrs[u].vertexPtr, Gptrs[v].vertexPtr
    lc.end_G = (lc.end_G[0], lc.end_G[1] - 1)
    v_ptrs.labelClass = None

    u = lc.end_H[0][lc.end_H[1] - 1]
    u_ptrs = Hptrs[u]
    w_ptrs = Hptrs[w]
    w_ptrs.vertexPtr[0][w_ptrs.vertexPtr[1]], u_ptrs.vertexPtr[0][u_ptrs.vertexPtr[1]] = \
            u_ptrs.vertexPtr[0][u_ptrs.vertexPtr[1]], w_ptrs.vertexPtr[0][w_ptrs.vertexPtr[1]]
    Hptrs[w].vertexPtr, Hptrs[u].vertexPtr = Hptrs[u].vertexPtr, Hptrs[w].vertexPtr
    lc.end_H = (lc.end_H[0], lc.end_H[1] - 1)
    w_ptrs.labelClass = None

    if lc.start_G == lc.end_G:
        lc.prev.next = lc.next
        lc.next.prev = lc.prev

def unassign(v, w, lc):
    if lc.start_G == lc.end_G:
        lc.prev.next = lc
        lc.next.prev = lc
    Gptrs[v].labelClass = lc
    Hptrs[w].labelClass = lc
    lc.end_G = (lc.end_G[0], lc.end_G[1] + 1)
    lc.end_H = (lc.end_H[0], lc.end_H[1] + 1)

def filter(v, w):
    splits = []
    for u in G[v]:
        lc = Gptrs[u].labelClass
        if lc is None:
            continue
        if not lc.splitting:
            lc.splitting = True
            create_label_class_after(lc)
            splits.append(lc)
        t = lc.end_G[0][lc.end_G[1] - 1]
        t_ptrs = Gptrs[t]
        u_ptrs = Gptrs[u]
        u_ptrs.vertexPtr[0][u_ptrs.vertexPtr[1]], t_ptrs.vertexPtr[0][t_ptrs.vertexPtr[1]] = \
                t_ptrs.vertexPtr[0][t_ptrs.vertexPtr[1]], u_ptrs.vertexPtr[0][u_ptrs.vertexPtr[1]]
        Gptrs[u].vertexPtr, Gptrs[t].vertexPtr = Gptrs[t].vertexPtr, Gptrs[u].vertexPtr
        Gptrs[u].labelClass = lc.next
        lc.end_G = (lc.end_G[0], lc.end_G[1] - 1)
        lc.next.start_G = (lc.next.start_G[0], lc.next.start_G[1] - 1)

    for u in H[w]:
        lc = Hptrs[u].labelClass
        if lc is None:
            continue
        if not lc.active:
            continue
        if not lc.splitting:
            lc.splitting = True
            create_label_class_after(lc)
            splits.append(lc)
        t = lc.end_H[0][lc.end_H[1] - 1]
        t_ptrs = Hptrs[t]
        u_ptrs = Hptrs[u]
        u_ptrs.vertexPtr[0][u_ptrs.vertexPtr[1]], t_ptrs.vertexPtr[0][t_ptrs.vertexPtr[1]] = \
                t_ptrs.vertexPtr[0][t_ptrs.vertexPtr[1]], u_ptrs.vertexPtr[0][u_ptrs.vertexPtr[1]]
        Hptrs[u].vertexPtr, Hptrs[t].vertexPtr = Hptrs[t].vertexPtr, Hptrs[u].vertexPtr
        Hptrs[u].labelClass = lc.next
        lc.end_H = (lc.end_H[0], lc.end_H[1] - 1)
        lc.next.start_H = (lc.next.start_H[0], lc.next.start_H[1] - 1)

    for lc in splits:
        lc.splitting = False

    for lc in splits:
        if lc.end_G[1] - lc.start_G[1] > lc.end_H[1] - lc.start_H[1]:
            return (splits, [], True)
        if lc.next.end_G[1] - lc.next.start_G[1] > lc.next.end_H[1] - lc.next.start_H[1]:
            return (splits, [], True)
    deletions = do_deletions(splits)
    return (splits, deletions, False)

def do_deletions(splits):
    deletions = []
    for lc in splits:
        if lc.start_G == lc.end_G:
            delete_label_class(lc)
            deletions.append(lc)
        if lc.next.start_G == lc.next.end_G:
            delete_label_class(lc.next)
            deletions.append(lc.next)
    return deletions

def delete_label_class(lc):
    lc.prev.next = lc.next
    lc.next.prev = lc.prev
    lc.active = False

def unfilter(splits, deletions):
    for lc in reversed(deletions):
        lc.prev.next = lc
        lc.next.prev = lc
        lc.active = True
    for lc in reversed(splits):
        for u in lc.next.start_G[0][lc.next.start_G[1]:lc.next.end_G[1]]:
            Gptrs[u].labelClass = lc
        for u in lc.next.start_H[0][lc.next.start_H[1]:lc.next.end_H[1]]:
            Hptrs[u].labelClass = lc
        lc.end_G = lc.next.end_G
        lc.end_H = lc.next.end_H
        lcn = lc.next
        lcn.prev.next = lcn.next
        lcn.next.prev = lcn.prev

def create_label_class_after(lc):
    new_lc = LC()
    new_lc.prev = lc
    new_lc.next = lc.next
    lc.next.prev = new_lc
    lc.next = new_lc
    new_lc.start_G = lc.end_G
    new_lc.end_G = lc.end_G
    new_lc.start_H = lc.end_H
    new_lc.end_H = lc.end_H
    new_lc.active = True
    new_lc.splitting = False

print(mcsplitsi(G, H))
print(search_calls)
