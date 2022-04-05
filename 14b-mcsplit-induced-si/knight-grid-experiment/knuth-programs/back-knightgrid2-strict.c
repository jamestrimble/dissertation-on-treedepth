#define maxn 24
#define maxm (maxn*maxn) 
#define pack(a,b) (((a) <<8) +(b) ) 
#define apart(q) ((q) >>8) 
#define bpart(q) ((q) &0xff)  \

/*1:*/
#line 50 "back-knightgrid2-strict.w"

#include <stdio.h> 
#include <stdlib.h> 
int n;
int mv[6]= {pack(-2,1),pack(-1,-2),pack(-1,2),pack(1,-2),pack(1,2),pack(2,-1)};
int occ[pack(maxn+maxn+1,maxn+maxn+1)];
typedef struct{
int move;
int maxa;
int mina;
int maxb;
int minb;
int pad5,pad6,pad7;
}state;
state st[maxm];
unsigned long long nodes;
main(int argc,char*argv[]){
register int i,j,k,m,q,qp,x,mxa,mna,mxb,mnb,athresh,bthresh;
/*2:*/
#line 74 "back-knightgrid2-strict.w"

if(argc!=2||sscanf(argv[1],"%d",
&n)!=1){
fprintf(stderr,"Usage: %s n\n",
argv[0]);
exit(-1);
}
if(n<4||n> maxn){
fprintf(stderr,"Sorry, n must be between 4 and %d!\n",
maxn);
exit(-2);
}
printf("2xm knight grids strictly in a %dx%d square\n",
n,n);

/*:2*/
#line 68 "back-knightgrid2-strict.w"
;
/*3:*/
#line 94 "back-knightgrid2-strict.w"

b1:athresh= n-3,bthresh= n-2;
q= pack(n+1,n+1);
st[1].maxa= st[1].mina= st[1].maxb= st[1].minb= mxa= mna= mxb= mnb= n+1;
k= 1,x= 3,m= 1;
goto b3;
b2pre:/*11:*/
#line 268 "back-knightgrid2-strict.w"

occ[q+pack(+2,+1)]++;
occ[q+pack(+2,-1)]++;
occ[q+pack(+1,+2)]++;
occ[q+pack(+1,-2)]++;
occ[q+pack(-1,+2)]++;
occ[q+pack(-1,-2)]++;
occ[q+pack(-2,+1)]++;
occ[q+pack(-2,-1)]++;
occ[q+pack(+4,+2)]++;
occ[q+pack(+4,+0)]++;
occ[q+pack(+3,+3)]++;
occ[q+pack(+3,-1)]++;
occ[q+pack(+1,+3)]++;
occ[q+pack(+1,-1)]++;
occ[q+pack(+0,+2)]++;
occ[q+pack(+0,+0)]++;

/*:11*/
#line 100 "back-knightgrid2-strict.w"
;
q= qp;
b2:nodes++;
if(k> m)/*13:*/
#line 304 "back-knightgrid2-strict.w"

{
m= k;
for(qp= pack(n+1-mna,n+1-mnb),k= 0;k<m;qp+= mv[st[++k].move]){
printf(" %d,%d",
apart(qp),bpart(qp));
}
printf("\n");
}

/*:13*/
#line 103 "back-knightgrid2-strict.w"
;
x= 0;
b3:switch(x){
case 0:/*5:*/
#line 136 "back-knightgrid2-strict.w"

qp= q+pack(-2,1);
if(occ[qp])goto bad0;
if(occ[qp+pack(2,1)])goto bad0;
if(apart(qp)<mna){
st[k+1].mina= apart(qp);
if(mxa-apart(qp)> athresh)goto bad0;
if(bpart(qp)> mxb){
st[k+1].maxb= bpart(qp);
if(bpart(qp)-mnb> bthresh)goto bad0;
mxb= bpart(qp),mna= apart(qp);
}else st[k+1].maxb= mxb,mna= apart(qp);
}else if(bpart(qp)> mxb){
st[k+1].maxb= bpart(qp);
if(bpart(qp)-mnb> bthresh)goto bad0;
mxb= bpart(qp),st[k+1].mina= mna;
}else st[k+1].maxb= mxb,st[k+1].mina= mna;
st[k+1].maxa= mxa,st[k+1].minb= mnb;
st[k].move= 0,k++;
goto b2pre;
bad0:

/*:5*/
#line 106 "back-knightgrid2-strict.w"
;
x++;
case 1:/*6:*/
#line 158 "back-knightgrid2-strict.w"

qp= q+pack(-1,-2);
if(occ[qp])goto bad1;
if(occ[qp+pack(2,1)])goto bad1;
if(apart(qp)<mna){
st[k+1].mina= apart(qp);
if(mxa-apart(qp)> athresh)goto bad1;
if(bpart(qp)<mnb){
st[k+1].minb= bpart(qp);
if(mxb-bpart(qp)> bthresh)goto bad1;
mnb= bpart(qp),mna= apart(qp);
}else st[k+1].minb= mnb,mna= apart(qp);
}else if(bpart(qp)<mnb){
st[k+1].minb= bpart(qp);
if(mxb-bpart(qp)> bthresh)goto bad1;
mnb= bpart(qp),st[k+1].mina= mna;
}else st[k+1].minb= mnb,st[k+1].mina= mna;
st[k+1].maxa= mxa,st[k+1].maxb= mxb;
st[k].move= 1,k++;
goto b2pre;
bad1:

/*:6*/
#line 108 "back-knightgrid2-strict.w"
;
x++;
case 2:/*7:*/
#line 180 "back-knightgrid2-strict.w"

qp= q+pack(-1,2);
if(occ[qp])goto bad2;
if(occ[qp+pack(2,1)])goto bad2;
if(apart(qp)<mna){
st[k+1].mina= apart(qp);
if(mxa-apart(qp)> athresh)goto bad2;
if(bpart(qp)> mxb){
st[k+1].maxb= bpart(qp);
if(bpart(qp)-mnb> bthresh)goto bad2;
mxb= bpart(qp),mna= apart(qp);
}else st[k+1].maxb= mxb,mna= apart(qp);
}else if(bpart(qp)> mxb){
st[k+1].maxb= bpart(qp);
if(bpart(qp)-mnb> bthresh)goto bad2;
mxb= bpart(qp),st[k+1].mina= mna;
}else st[k+1].maxb= mxb,st[k+1].mina= mna;
st[k+1].maxa= mxa,st[k+1].minb= mnb;
st[k].move= 2,k++;
goto b2pre;
bad2:

/*:7*/
#line 110 "back-knightgrid2-strict.w"
;
x++;
case 3:/*8:*/
#line 202 "back-knightgrid2-strict.w"

qp= q+pack(1,-2);
if(occ[qp])goto bad3;
if(occ[qp+pack(2,1)])goto bad3;
if(apart(qp)> mxa){
st[k+1].maxa= apart(qp);
if(apart(qp)-mna> athresh)goto bad3;
if(bpart(qp)<mnb){
st[k+1].minb= bpart(qp);
if(mxb-bpart(qp)> bthresh)goto bad3;
mnb= bpart(qp),mxa= apart(qp);
}else st[k+1].minb= mnb,mxa= apart(qp);
}else if(bpart(qp)<mnb){
st[k+1].minb= bpart(qp);
if(mxb-bpart(qp)> bthresh)goto bad3;
mnb= bpart(qp),st[k+1].maxa= mxa;
}else st[k+1].minb= mnb,st[k+1].maxa= mxa;
st[k+1].mina= mna,st[k+1].maxb= mxb;
st[k].move= 3,k++;
goto b2pre;
bad3:

/*:8*/
#line 112 "back-knightgrid2-strict.w"
;
x++;
case 4:/*9:*/
#line 224 "back-knightgrid2-strict.w"

qp= q+pack(1,2);
if(occ[qp])goto bad4;
if(occ[qp+pack(2,1)])goto bad4;
if(apart(qp)> mxa){
st[k+1].maxa= apart(qp);
if(apart(qp)-mna> athresh)goto bad4;
if(bpart(qp)> mxb){
st[k+1].maxb= bpart(qp);
if(bpart(qp)-mnb> bthresh)goto bad4;
mxb= bpart(qp),mxa= apart(qp);
}else st[k+1].maxb= mxb,mxa= apart(qp);
}else if(bpart(qp)> mxb){
st[k+1].maxb= bpart(qp);
if(bpart(qp)-mnb> bthresh)goto bad4;
mxb= bpart(qp),st[k+1].maxa= mxa;
}else st[k+1].maxb= mxb,st[k+1].maxa= mxa;
st[k+1].mina= mna,st[k+1].minb= mnb;
st[k].move= 4,k++;
goto b2pre;
bad4:

/*:9*/
#line 114 "back-knightgrid2-strict.w"
;
x++;
case 5:/*10:*/
#line 246 "back-knightgrid2-strict.w"

qp= q+pack(2,-1);
if(occ[qp])goto bad5;
if(occ[qp+pack(2,1)])goto bad5;
if(apart(qp)> mxa){
st[k+1].maxa= apart(qp);
if(apart(qp)-mna> athresh)goto bad5;
if(bpart(qp)<mnb){
st[k+1].minb= bpart(qp);
if(mxb-bpart(qp)> bthresh)goto bad5;
mnb= bpart(qp),mxa= apart(qp);
}else st[k+1].minb= mnb,mxa= apart(qp);
}else if(bpart(qp)<mnb){
st[k+1].minb= bpart(qp);
if(mxb-bpart(qp)> bthresh)goto bad5;
mnb= bpart(qp),st[k+1].maxa= mxa;
}else st[k+1].minb= mnb,st[k+1].maxa= mxa;
st[k+1].mina= mna,st[k+1].maxb= mxb;
st[k].move= 5,k++;
goto b2pre;
bad5:

/*:10*/
#line 116 "back-knightgrid2-strict.w"
;
x++;
case 6:b5:/*4:*/
#line 121 "back-knightgrid2-strict.w"

k--;
x= st[k].move+1;
q-= mv[x-1];
/*12:*/
#line 286 "back-knightgrid2-strict.w"

occ[q+pack(+2,+1)]--;
occ[q+pack(+2,-1)]--;
occ[q+pack(+1,+2)]--;
occ[q+pack(+1,-2)]--;
occ[q+pack(-1,+2)]--;
occ[q+pack(-1,-2)]--;
occ[q+pack(-2,+1)]--;
occ[q+pack(-2,-1)]--;
occ[q+pack(+4,+2)]--;
occ[q+pack(+4,+0)]--;
occ[q+pack(+3,+3)]--;
occ[q+pack(+3,-1)]--;
occ[q+pack(+1,+3)]--;
occ[q+pack(+1,-1)]--;
occ[q+pack(+0,+2)]--;
occ[q+pack(+0,+0)]--;

/*:12*/
#line 125 "back-knightgrid2-strict.w"
;
mxa= st[k].maxa,mna= st[k].mina,mxb= st[k].maxb,mnb= st[k].minb;
if(k)goto b3;

/*:4*/
#line 118 "back-knightgrid2-strict.w"
;
}

/*:3*/
#line 69 "back-knightgrid2-strict.w"
;
printf("Max m is %d (%lld nodes).\n",
m,nodes);
}

/*:1*/
