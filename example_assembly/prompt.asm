LUI GP0, #64 ; Peripheral address
ADDI GP0, #1 ; Address for TTY
CMP GP3, GP2 ; Wtf? Lol
JEQ #3 ; Jump is equals (Yes if this is the first loop)
loop:
LD GP2, GP0, #1 ; Load 2nd peripheral address (value) into GP2
ST GP2, GP0, #0 ; Store GP2 on TTY
MOV GP3, GP2 ; Move the value from GP3 (0) into GP2
JMP :loop # Jump to loop label
