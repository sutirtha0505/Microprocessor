//PALINDROME NUMBER
LXI H,F000       ; HL points to input byte
MOV A,M          ; Load original byte into A
MOV B,A          ; Copy to B for rotation
MVI C,08         ; Counter to rotate 8 times

ROTATE_LOOP:
RLC              ; Rotate B left by 1 in each loop
DCR C
JNZ ROTATE_LOOP

XRA A,B          ; XOR original and rotated
JZ PALINDROME    ; If zero, palindrome
MVI A,00
JMP DONE

PALINDROME:
MVI A,01

DONE:
STA F001         ; Store result
HLT