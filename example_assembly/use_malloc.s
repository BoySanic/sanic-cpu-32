	SECTION .text
sc32_putc:                              ; -- Begin function sc32_putc
                                        ; @sc32_putc
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #1
                                        ; kill: def $gp2 killed $gp23
	STB GP23, GP0, #-1
	LDB GP2, GP0, #-1
	LUI GP3, #1024
	ORI GP3, #1
	STB GP2, GP3, #0
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
sc32_prints:                            ; -- Begin function sc32_prints
                                        ; @sc32_prints
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #12
	ST GP23, GP0, #-4
	LLI GP2, #0
	ST GP2, GP0, #-8
	JMP LBB1_123
LBB1_123:                                 ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	LDB GP2, GP0, #-9
	SHLI GP2, #24
	SRAI GP2, #24
	LLI GP3, #0
	CMP GP2, GP3
	JEQ LBB1_3123
	JMP LBB1_2123
LBB1_2123:                                 ; %while.body
                                        ;   in Loop: Header=BB1_1 Depth=1
	LD GP2, GP0, #-4
	LD GP3, GP0, #-8
	ADD GP2, GP3
	LDB GP2, GP2, #0
	STB GP2, GP0, #-9
	LD GP2, GP0, #-4
	LD GP3, GP0, #-8
	ADD GP2, GP3
	LDB GP23, GP2, #0
	SHLI GP23, #24
	SRAI GP23, #24
	CALLI sc32_putc
	LD GP2, GP0, #-8
	ADDI GP2, #1
	ST GP2, GP0, #-8
	JMP LBB1_1
LBB1_3123:                                 ; %while.end
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
get_input:                              ; -- Begin function get_input
                                        ; @get_input
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #24
	LLI GP2, #0
	ST GP2, GP0, #-20
	STB GP2, GP0, #-1
	LLI GP23, #16
	ST GP23, GP0, #-24
	CALLI malloc
	LD GP3, GP0, #-24
	LD GP2, GP0, #-20
	ST GP28, GP0, #-8
	ST GP3, GP0, #-12
	ST GP2, GP0, #-16
	JMP LBB2_1123 
LBB2_1123:                                 ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	LDB GP2, GP0, #-1
	SHLI GP2, #24
	SRAI GP2, #24
	LLI GP3, #10
	CMP GP2, GP3
	JEQ LBB2_7123
	JMP LBB2_2123
LBB2_2123:                                 ; %while.body
                                        ;   in Loop: Header=BB2_1 Depth=1
	LLI GP2, #2
	STB GP2, GP0, #-1
	LDB GP2, GP0, #-1
	SHLI GP2, #24
	SRAI GP2, #24
	LLI GP3, #0
	CMP GP2, GP3
	JEQ LBB2_6123
	JMP LBB2_3123
LBB2_3123:                                 ; %if.then
                                        ;   in Loop: Header=BB2_1 Depth=1
	LD GP2, GP0, #-16
	LD GP3, GP0, #-12
	CMP GP2, GP3
	JNE LBB2_5123
	JMP LBB2_4123
LBB2_4123:                                 ; %if.then7
                                        ;   in Loop: Header=BB2_1 Depth=1
	LD GP2, GP0, #-12
	ADDI GP2, #16
	ST GP2, GP0, #-12
	LD GP23, GP0, #-8
	LD GP24, GP0, #-12
	CALLI realloc
	JMP LBB2_5123
LBB2_5123:                                 ; %if.end
                                        ;   in Loop: Header=BB2_1 Depth=1
	LDB GP2, GP0, #-1
	LD GP3, GP0, #-8
	LD GP4, GP0, #-16
	ADD GP3, GP4
	STB GP2, GP3, #0
	LD GP2, GP0, #-16
	ADDI GP2, #1
	ST GP2, GP0, #-16
	JMP LBB2_6123
LBB2_6123:                                 ; %if.end9
                                        ;   in Loop: Header=BB2_1 Depth=1
	JMP LBB2_1123
LBB2_7123:                                 ; %while.end
	LD GP28, GP0, #-8
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
	SECTION .main
main:                                   ; -- Begin function main
                                        ; @main
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #8
	LLI GP2, #0
	ST GP2, GP0, #-4
	JMP LBB3_1123
LBB3_1123:                                 ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	CALLI get_input
	ST GP28, GP0, #-8
	LD GP23, GP0, #-8
	CALLI sc32_prints
	JMP LBB3_1123
                                        ; -- End function
