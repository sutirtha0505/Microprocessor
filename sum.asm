//Add two 8 bit numbers
F000 : 1st 8 bit number //45
F001 : 2nd 8 bit number //22
F002 : SUM
F003 : CARRY

LXI H, F000H    //HL points to 1st number
MOV A,M        //Move 1st number to the accumulator
INX H           //Increment H,L Rester Pair
MOV B,M        //HL now points to the 2nd number
MVI C,00       //00 is put inside C register
ADD B           //A <- A + B
JNC L1          //Jump if no carry to L1
MVI C, 01       //Move the 01 value to C register
L1: STA F002H   //Label L1 says Store accumulator to F002H address
MOV A,C        //Move the carry's value to accumulator
STA F003H       //Store Accumulator's value in Address F003H
HLT             //Stops the program
