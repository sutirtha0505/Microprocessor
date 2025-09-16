//BUBBLE SORT
F000: 4    M     //N
F001: 03    
F002: 09
F003: 07
F004: 05

FOR(I=0; I<N-1; I++){
    FOR(J=0; J<N-I; J++){
        IF(A[J]>A[J+1]){
            T=A[J]
            A[J]=A[J+1]
            A[J+1]=T
        }
    }
}

START:LXI H,F000H
MOV C,M             //HERE C=N
DCR C               //NOW IT'S N-1

OUTER: MOV B,C      //B-N-1
LXI H,F001H         //GOES TO FIRST ELEMENT

INNER: MOV A,M      //ACC=A[J]
INX H               //MEMORY MOVES FORWARD, J+1
CMP M               //COMPARES MEMORY WITH ACC
JC NO_SWAP
//SWAP//
MOV D,M             //TEMP = A[J+1]
MOV M,A             //A[J+1]=A[J]
DCR H
MOV M,D             //A[J]=OLD A[J]
INX H
NO_SWAP: DCR B
    JNZ INNER
    DCR C
    JNZ OUTER
HLT
