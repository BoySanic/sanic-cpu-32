; Load peripheral addresses into registers
LUI GP31, #64 ; Peripheral address
MOV GP30, GP31 ; Copy peripheral address
ADDI GP31, #1 ; TTY
ADDI GP30, #2 ; keyboard

; Memory allocation
LUI GP29, #255 ; Memory
ADDI GP29, #65535 ; Max memory address
SUBI GP29, #256 ; Reduce stack to allocate memory for command table (256 4-byte words)
MOV GP28, GP29 ; Copy pointer for command table to GP28


