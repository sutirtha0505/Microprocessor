//SQRT OF N NUMBERS
LXI H, F000      ; HL points to source (F000)
LXI D, F100      ; DE points to dest (F100)
MVI B, 0A        ; B = 10 numbers to process

NEXTNUM:
MOV A, M         ; A = current (perfect square) number
MVI C, 00        ; C = sqrt result
MVI L, 01        ; L = odd number to subtract (1, 3, 5...)

FINDSQRT:
SUB L            ; A = A - L
JC STORE         ; If negative, done
INR L            ; Next odd (+1)
INR L            ; Next odd (+1)
INR C            ; C++
JMP FINDSQRT

STORE:
MOV A, C         ; A = sqrt
STAX D           ; Store result at [DE]
INX H            ; Next source
INX D            ; Next dest
DCR B
JNZ NEXTNUM

HLT