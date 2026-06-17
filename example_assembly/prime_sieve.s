	SECTION .text
sieve:                                  ; -- Begin function sieve
                                        ; @sieve
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #16
	ST GP23, GP0, #-8
	ST GP24, GP0, #-4
	MOV GP23, GP24
	ADDI GP23, #1
	CALLI malloc
	LLI GP23, #0
	CMP GP28, GP23
	JEQ primeLBB0_17
primeLBB0_1:                                 ; %for.cond.preheader
	LD GP6, GP0, #-4
	CMP GP6, GP23
	ST GP23, GP0, #-16
	JLT primeLBB0_13
primeLBB0_2:                                 ; %for.body.preheader
	LLI GP3, #0
	LLI GP2, #1
	MOV GP4, GP3
primeLBB0_3:                                 ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	MOV GP5, GP28
	ADD GP5, GP3
	STB GP2, GP5, #0
	ADDI GP4, #1
	CMP GP3, GP6
	MOV GP3, GP4
	JLT primeLBB0_3
primeLBB0_4:                                 ; %for.cond3.preheader
	LLI GP2, #4
	CMP GP6, GP2
	JGEU primeLBB0_5
primeLBB0_10:                                ; %for.body33.preheader
	LLI GP2, #0
	MOV GP23, GP2
	MOV GP3, GP2
primeLBB0_11:                                ; %for.body33
                                        ; =>This Inner Loop Header: Depth=1
	MOV GP4, GP28
	ADD GP4, GP2
	LDB GP4, GP4, #0
	ADD GP23, GP4
	ADDI GP3, #1
	CMP GP2, GP6
	MOV GP2, GP3
	JLT primeLBB0_11
primeLBB0_12:                                ; %for.cond.cleanup32.loopexit
	SHLI GP23, #2
primeLBB0_13:                                ; %for.cond.cleanup32
	ST GP28, GP0, #-12
	CALLI malloc
	LD GP2, GP0, #-8
	ST GP28, GP2, #0
	LD GP2, GP0, #-16
	CMP GP28, GP2
	JEQ primeLBB0_25
primeLBB0_14:                                ; %for.cond49.preheader
	LLI GP2, #2
	LD GP6, GP0, #-4
	LLI GP7, #0
	CMP GP6, GP2
	JGE primeLBB0_20
primeLBB0_15:
	LD GP23, GP0, #-12
primeLBB0_16:                                ; %for.cond.cleanup52
	ST GP7, GP0, #-4
	CALLI free
	LD GP28, GP0, #-4
	MOV GP29, GP0
	POP GP0
	RET
primeLBB0_17:                                ; %if.then
	LUI GP23, .primestr
	ORI GP23, .primestr
	CALLI sc32_prints
	JMP primeLBB0_18
primeLBB0_25:                                ; %if.then46
	LUI GP23, .primestr.1
	ORI GP23, .primestr.1
	CALLI sc32_prints
	LD GP23, GP0, #-12
	CALLI free
primeLBB0_18:                                ; %cleanup63
	LUI GP28, #1048575
	ORI GP28, #1048575
	MOV GP29, GP0
	POP GP0
	RET
primeLBB0_5:                                 ; %for.body7.preheader
	LLI GP3, #2
	LLI GP4, #0
	JMP primeLBB0_6
primeLBB0_9:                                 ; %for.inc24
                                        ;   in Loop: Header=BB0_6 Depth=1
	ADDI GP3, #1
	MOV GP2, GP3
	MUL GP2, GP2
	CMP GP2, GP6
	JGT primeLBB0_10
primeLBB0_6:                                 ; %for.body7
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_8 Depth 2
	CMP GP2, GP6
	JGT primeLBB0_9
primeLBB0_7:                                 ; %for.body7
                                        ;   in Loop: Header=BB0_6 Depth=1
	MOV GP5, GP28
	ADD GP5, GP3
	LDB GP5, GP5, #0
	ANDI GP5, #1
	CMP GP5, GP4
	JEQ primeLBB0_9
primeLBB0_8:                                 ; %for.body18
                                        ;   Parent Loop BB0_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	MOV GP5, GP28
	ADD GP5, GP2
	STB GP4, GP5, #0
	ADD GP2, GP3
	CMP GP2, GP6
	JLE primeLBB0_8
	JMP primeLBB0_9
primeLBB0_20:                                ; %for.body53.preheader
	LLI GP3, #1
	LD GP23, GP0, #-12
	JMP primeLBB0_21
primeLBB0_23:                                ; %if.then56
                                        ;   in Loop: Header=BB0_21 Depth=1
	MOV GP4, GP7
	SHLI GP4, #2
	MOV GP5, GP28
	ADD GP5, GP4
	ST GP2, GP5, #0
	ADDI GP7, #1
primeLBB0_24:                                ; %for.inc60
                                        ;   in Loop: Header=BB0_21 Depth=1
	MOV GP4, GP2
	ADDI GP4, #1
	CMP GP2, GP6
	MOV GP2, GP4
	JGE primeLBB0_16
primeLBB0_21:                                ; %for.body53
                                        ; =>This Inner Loop Header: Depth=1
	MOV GP4, GP23
	ADD GP4, GP2
	LDB GP4, GP4, #0
	CMP GP4, GP3
	JEQ primeLBB0_23
primeLBB0_22:                                ;   in Loop: Header=BB0_21 Depth=1
	JMP primeLBB0_24
                                        ; -- End function
	SECTION .main
main:                                   ; -- Begin function main
                                        ; @main
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #28
	LLI GP2, #0
	ST GP2, GP0, #-8
	ST GP2, GP0, #-4
	CALLI sc32_read_clock
	ST GP28, GP0, #-24
	MOV GP23, GP0
	SUBI GP23, #4
	LLI GP24, #5000
	CALLI sieve
	ST GP28, GP0, #-12
	CALLI sc32_read_clock
	ST GP28, GP0, #-28
	LD GP3, GP0, #-12
	LLI GP2, #1
	CMP GP3, GP2
	LD GP2, GP0, #-8
	JLT primeLBB1_3
primeLBB1_1:                                 ; %for.body.lr.ph
	LD GP4, GP0, #-4
	ST GP4, GP0, #-16
	LLI GP4, #32
	ST GP4, GP0, #-20
primeLBB1_2:                                 ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	ST GP2, GP0, #-8
	LD GP2, GP0, #-8
	SHLI GP2, #2
	LD GP3, GP0, #-16
	ADD GP3, GP2
	LD GP23, GP3, #0
	CALLI sc32_print_dec
	LD GP23, GP0, #-20
	CALLI sc32_putc
	LD GP3, GP0, #-12
	LD GP2, GP0, #-8
	ADDI GP2, #1
	CMP GP2, GP3
	JLT primeLBB1_2
primeLBB1_3:                                 ; %for.cond.cleanup
	LUI GP23, .primestr.2
	ORI GP23, .primestr.2
	CALLI sc32_prints
	LD GP2, GP0, #-24
	LD GP23, GP0, #-28
	SUB GP23, GP2
	CALLI sc32_print_dec
	LLI GP23, #10
	CALLI sc32_putc
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
	SECTION .rodata.primestr1.1
.primestr:                                   ; @.str
	DB 69
	DB 114
	DB 114
	DB 111
	DB 114
	DB 58
	DB 32
	DB 109
	DB 97
	DB 108
	DB 108
	DB 111
	DB 99
	DB 32
	DB 102
	DB 97
	DB 105
	DB 108
	DB 101
	DB 100
	DB 32
	DB 116
	DB 111
	DB 32
	DB 97
	DB 108
	DB 108
	DB 111
	DB 99
	DB 97
	DB 116
	DB 101
	DB 32
	DB 115
	DB 105
	DB 101
	DB 118
	DB 101
	DB 32
	DB 97
	DB 114
	DB 114
	DB 97
	DB 121
	DB 33
	DB 10
	DB 0

.primestr.1:                                 ; @.str.1
	DB 69
	DB 114
	DB 114
	DB 111
	DB 114
	DB 58
	DB 32
	DB 109
	DB 97
	DB 108
	DB 108
	DB 111
	DB 99
	DB 32
	DB 102
	DB 97
	DB 105
	DB 108
	DB 101
	DB 100
	DB 32
	DB 116
	DB 111
	DB 32
	DB 97
	DB 108
	DB 108
	DB 111
	DB 99
	DB 97
	DB 116
	DB 101
	DB 32
	DB 114
	DB 101
	DB 115
	DB 117
	DB 108
	DB 116
	DB 115
	DB 32
	DB 97
	DB 114
	DB 114
	DB 97
	DB 121
	DB 33
	DB 10
	DB 0

.primestr.2:                                 ; @.str.2
	DB 69
	DB 120
	DB 101
	DB 99
	DB 117
	DB 116
	DB 105
	DB 111
	DB 110
	DB 32
	DB 102
	DB 105
	DB 110
	DB 105
	DB 115
	DB 104
	DB 101
	DB 100
	DB 46
	DB 32
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
	DB 58
	DB 32
	DB 0

