	SECTION .main
main:                                   ; -- Begin function main
                                        ; @main
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #36
	LUI GP23, .pstr
	ORI GP23, .pstr
	CALLI sc32_prints
	LUI GP23, #1024
	ST GP23, GP0, #-16
	ORI GP23, #3
	CALLI sc32_print_hex
	LLI GP23, #10
	ST GP23, GP0, #-12
	CALLI sc32_putc
	LUI GP23, .pstr.1
	ORI GP23, .pstr.1
	CALLI sc32_prints
	LD GP23, GP0, #-16
	ORI GP23, #1
	CALLI sc32_print_hex
	LD GP23, GP0, #-12
	CALLI sc32_putc
	LLI GP2, #0
	ST GP2, GP0, #-24
	MOV GP2, GP0
	SUBI GP2, #4
	ST GP2, GP0, #-28
	MOV GP2, GP0
	SUBI GP2, #8
	ST GP2, GP0, #-32
	LUI GP2, .pstr.2
	ORI GP2, .pstr.2
	ST GP2, GP0, #-36
pLBB0_1:                                 ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	CALLI sc32_readline
	ST GP28, GP0, #-16
	LD GP23, GP0, #-12
	CALLI sc32_putc
	LD GP2, GP0, #-24
	ST GP2, GP0, #-4
	ST GP2, GP0, #-8
	LD GP23, GP0, #-28
	CALLI sc32_read_clock
	LD GP23, GP0, #-16
	CALLI sc32_prints
	LD GP23, GP0, #-12
	CALLI sc32_putc
	LD GP23, GP0, #-32
	CALLI sc32_read_clock
	LD GP2, GP0, #-8
	ST GP2, GP0, #-16
	LD GP2, GP0, #-4
	ST GP2, GP0, #-20
	LD GP23, GP0, #-36
	CALLI sc32_prints
	LD GP23, GP0, #-16
	LD GP2, GP0, #-20
	SUB GP23, GP2
	CALLI sc32_print_dec
	LD GP23, GP0, #-12
	CALLI sc32_putc
	JMP pLBB0_1
                                        ; -- End function
	SECTION .rodata.pstr1.1
.pstr:                                   ; @.pstr
	DB 67
	DB 108
	DB 111
	DB 99
	DB 107
	DB 32
	DB 97
	DB 100
	DB 100
	DB 114
	DB 58
	DB 32
	DB 0

.pstr.1:                                 ; @.pstr.1
	DB 83
	DB 116
	DB 100
	DB 111
	DB 117
	DB 116
	DB 32
	DB 97
	DB 100
	DB 100
	DB 114
	DB 58
	DB 32
	DB 0

.pstr.2:                                 ; @.pstr.2
	DB 67
	DB 108
	DB 111
	DB 99
	DB 107
	DB 115
	DB 32
	DB 116
	DB 97
	DB 107
	DB 101
	DB 110
	DB 32
	DB 116
	DB 111
	DB 32
	DB 112
	DB 114
	DB 105
	DB 110
	DB 116
	DB 58
	DB 32
	DB 0

