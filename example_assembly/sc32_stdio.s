	SECTION .text
sc32_putc:                              ; -- Begin function sc32_putc
                                        ; @sc32_putc
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #1
	STB GP23, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP23, #1
	MOV GP25, GP23
	CALLI sc32_write
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
sc32_getc:                              ; -- Begin function sc32_getc
                                        ; @sc32_getc
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #1
	LLI GP23, #0
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP25, #1
	CALLI sc32_read
	LDB GP28, GP0, #-1
	SHLI GP28, #24
	SRAI GP28, #24
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
sc32_print_hex:                         ; -- Begin function sc32_print_hex
                                        ; @sc32_print_hex
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #20
	ST GP23, GP0, #-8
	LUI GP24, .sstr
	ORI GP24, .sstr
	LLI GP23, #1
	ST GP23, GP0, #-12
	LLI GP25, #2
	CALLI sc32_write
	LUI GP3, __const.sc32_print_hex.hex
	ORI GP3, __const.sc32_print_hex.hex
	ST GP3, GP0, #-16
	LD GP2, GP0, #-8
	SHRI GP2, #28
	ADD GP2, GP3
	LDB GP2, GP2, #0
	STB GP2, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	ST GP24, GP0, #-20
	LD GP23, GP0, #-12
	MOV GP25, GP23
	CALLI sc32_write
	LD GP2, GP0, #-8
	SHRI GP2, #24
	ANDI GP2, #15
	LD GP3, GP0, #-16
	ADD GP2, GP3
	LDB GP2, GP2, #0
	STB GP2, GP0, #-1
	LD GP23, GP0, #-12
	LD GP24, GP0, #-20
	MOV GP25, GP23
	CALLI sc32_write
	LD GP2, GP0, #-8
	SHRI GP2, #20
	ANDI GP2, #15
	LD GP3, GP0, #-16
	ADD GP2, GP3
	LDB GP2, GP2, #0
	STB GP2, GP0, #-1
	LD GP23, GP0, #-12
	LD GP24, GP0, #-20
	MOV GP25, GP23
	CALLI sc32_write
	LD GP2, GP0, #-8
	SHRI GP2, #16
	ANDI GP2, #15
	LD GP3, GP0, #-16
	ADD GP2, GP3
	LDB GP2, GP2, #0
	STB GP2, GP0, #-1
	LD GP23, GP0, #-12
	LD GP24, GP0, #-20
	MOV GP25, GP23
	CALLI sc32_write
	LD GP2, GP0, #-8
	SHRI GP2, #12
	ANDI GP2, #15
	LD GP3, GP0, #-16
	ADD GP2, GP3
	LDB GP2, GP2, #0
	STB GP2, GP0, #-1
	LD GP23, GP0, #-12
	LD GP24, GP0, #-20
	MOV GP25, GP23
	CALLI sc32_write
	LD GP2, GP0, #-8
	SHRI GP2, #8
	ANDI GP2, #15
	LD GP3, GP0, #-16
	ADD GP2, GP3
	LDB GP2, GP2, #0
	STB GP2, GP0, #-1
	LD GP23, GP0, #-12
	LD GP24, GP0, #-20
	MOV GP25, GP23
	CALLI sc32_write
	LD GP2, GP0, #-8
	SHRI GP2, #4
	ANDI GP2, #15
	LD GP3, GP0, #-16
	ADD GP2, GP3
	LDB GP2, GP2, #0
	STB GP2, GP0, #-1
	LD GP23, GP0, #-12
	LD GP24, GP0, #-20
	MOV GP25, GP23
	CALLI sc32_write
	LD GP2, GP0, #-8
	ANDI GP2, #15
	LD GP3, GP0, #-16
	ADD GP2, GP3
	LDB GP2, GP2, #0
	STB GP2, GP0, #-1
	LD GP23, GP0, #-12
	LD GP24, GP0, #-20
	MOV GP25, GP23
	CALLI sc32_write
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
sc32_prints:                            ; -- Begin function sc32_prints
                                        ; @sc32_prints
; %bb.0:                                ; %entry
	MOV GP24, GP23
	LLI GP2, #0
	MOV GP3, GP2
SLBB3_1:                                 ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	MOV GP25, GP3
	MOV GP4, GP24
	ADD GP4, GP25
	ADDI GP3, #1
	LDB GP4, GP4, #0
	CMP GP4, GP2
	JNE SLBB3_1
SLBB3_2:                                 ; %while.end
	LLI GP23, #1
	CALLI sc32_write
	RET
                                        ; -- End function
sc32_print_dec:                         ; -- Begin function sc32_print_dec
                                        ; @sc32_print_dec
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #16
	LUI GP2, #244140
	ORI GP2, #707072
	ST GP23, GP0, #-8
	CMP GP23, GP2
	LUI GP4, #104857
	LUI GP2, #838860
	ST GP4, GP0, #-12
	ST GP2, GP0, #-16
	JGEU SLBB4_1
SLBB4_2:                                 ; %if.end
	LUI GP2, #24414
	ORI GP2, #385280
	LD GP3, GP0, #-8
	CMP GP3, GP2
	JGEU SLBB4_3
SLBB4_4:                                 ; %if.end.1
	LUI GP2, #2441
	ORI GP2, #562816
	LD GP3, GP0, #-8
	CMP GP3, GP2
	JGEU SLBB4_5
SLBB4_6:                                 ; %if.end.2
	LLI GP2, #1000000
	LD GP3, GP0, #-8
	CMP GP3, GP2
	JGEU SLBB4_7
SLBB4_8:                                 ; %if.end.3
	LLI GP2, #100000
	LD GP3, GP0, #-8
	CMP GP3, GP2
	JGEU SLBB4_9
SLBB4_10:                                ; %if.end.4
	LLI GP2, #10000
	LD GP3, GP0, #-8
	CMP GP3, GP2
	JGEU SLBB4_11
SLBB4_12:                                ; %if.end.5
	LLI GP2, #1000
	LD GP3, GP0, #-8
	CMP GP3, GP2
	JGEU SLBB4_13
SLBB4_14:                                ; %if.end.6
	LLI GP2, #100
	LD GP3, GP0, #-8
	CMP GP3, GP2
	JGEU SLBB4_15
SLBB4_16:                                ; %if.end.7
	LLI GP2, #10
	LD GP3, GP0, #-8
	CMP GP3, GP2
	JGEU SLBB4_17
SLBB4_18:                                ; %if.end.8
	LLI GP2, #0
	LD GP3, GP0, #-8
	CMP GP3, GP2
	LD GP4, GP0, #-16
	JNE SLBB4_19
	JMP SLBB4_20
SLBB4_1:                                 ; %if.end.thread
	LD GP2, GP0, #-8
	SHRI GP2, #9
	MULI GP2, #281475
	AMOV GP2
	SHRI GP2, #7
	ORI GP2, #48
	STB GP2, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP23, #1
	MOV GP25, GP23
	CALLI sc32_write
	LD GP4, GP0, #-12
SLBB4_3:                                 ; %if.end.1.thread
	LUI GP2, #351843
	ORI GP2, #408457
	LD GP3, GP0, #-8
	MUL GP3, GP2
	AMOV GP2
	SHRI GP2, #25
	MOV GP3, GP4
	ORI GP3, #629146
	MOV GP4, GP2
	MUL GP4, GP3
	AMOV GP3
	MULI GP3, #10
	SUB GP2, GP3
	ORI GP2, #48
	STB GP2, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP23, #1
	MOV GP25, GP23
	CALLI sc32_write
	LD GP4, GP0, #-12
SLBB4_5:                                 ; %if.end.2.thread
	LUI GP2, #439804
	ORI GP2, #1034859
	LD GP3, GP0, #-8
	MUL GP3, GP2
	AMOV GP2
	SHRI GP2, #22
	MOV GP3, GP4
	ORI GP3, #629146
	MOV GP4, GP2
	MUL GP4, GP3
	AMOV GP3
	MULI GP3, #10
	SUB GP2, GP3
	ORI GP2, #48
	STB GP2, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP23, #1
	MOV GP25, GP23
	CALLI sc32_write
	LD GP4, GP0, #-12
SLBB4_7:                                 ; %if.end.3.thread
	LUI GP2, #274877
	ORI GP2, #777859
	LD GP3, GP0, #-8
	MUL GP3, GP2
	AMOV GP2
	SHRI GP2, #18
	MOV GP3, GP4
	ORI GP3, #629146
	MOV GP4, GP2
	MUL GP4, GP3
	AMOV GP3
	MULI GP3, #10
	SUB GP2, GP3
	ORI GP2, #48
	STB GP2, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP23, #1
	MOV GP25, GP23
	CALLI sc32_write
	LD GP4, GP0, #-12
SLBB4_9:                                 ; %if.end.4.thread
	LUI GP2, #42949
	ORI GP2, #809669
	LD GP3, GP0, #-8
	SHRI GP3, #5
	MUL GP3, GP2
	AMOV GP2
	SHRI GP2, #7
	MOV GP3, GP4
	ORI GP3, #629146
	MOV GP4, GP2
	MUL GP4, GP3
	AMOV GP3
	MULI GP3, #10
	SUB GP2, GP3
	ORI GP2, #48
	STB GP2, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP23, #1
	MOV GP25, GP23
	CALLI sc32_write
	LD GP4, GP0, #-12
SLBB4_11:                                ; %if.end.5.thread
	LUI GP2, #858993
	ORI GP2, #464729
	LD GP3, GP0, #-8
	MUL GP3, GP2
	AMOV GP2
	SHRI GP2, #13
	MOV GP3, GP4
	ORI GP3, #629146
	MOV GP4, GP2
	MUL GP4, GP3
	AMOV GP3
	MULI GP3, #10
	SUB GP2, GP3
	ORI GP2, #48
	STB GP2, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP23, #1
	MOV GP25, GP23
	CALLI sc32_write
	LD GP4, GP0, #-12
SLBB4_13:                                ; %if.end.6.thread
	LUI GP2, #67108
	ORI GP2, #150995
	LD GP3, GP0, #-8
	MUL GP3, GP2
	AMOV GP2
	SHRI GP2, #6
	MOV GP3, GP4
	ORI GP3, #629146
	MOV GP4, GP2
	MUL GP4, GP3
	AMOV GP3
	MULI GP3, #10
	SUB GP2, GP3
	ORI GP2, #48
	STB GP2, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP23, #1
	MOV GP25, GP23
	CALLI sc32_write
	LD GP4, GP0, #-12
SLBB4_15:                                ; %if.end.7.thread
	LUI GP2, #335544
	ORI GP2, #754975
	LD GP3, GP0, #-8
	MUL GP3, GP2
	AMOV GP2
	SHRI GP2, #5
	MOV GP3, GP4
	ORI GP3, #629146
	MOV GP4, GP2
	MUL GP4, GP3
	AMOV GP3
	MULI GP3, #10
	SUB GP2, GP3
	ORI GP2, #48
	STB GP2, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP23, #1
	MOV GP25, GP23
	CALLI sc32_write
	LD GP4, GP0, #-12
SLBB4_17:                                ; %if.end.8.thread
	LD GP2, GP0, #-16
	ORI GP2, #838861
	LD GP3, GP0, #-8
	MUL GP3, GP2
	AMOV GP2
	SHRI GP2, #3
	ORI GP4, #629146
	MOV GP3, GP2
	MUL GP3, GP4
	AMOV GP3
	MULI GP3, #10
	SUB GP2, GP3
	ORI GP2, #48
	STB GP2, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP23, #1
	MOV GP25, GP23
	CALLI sc32_write
	LD GP4, GP0, #-16
SLBB4_19:                                ; %if.then.9
	ORI GP4, #838861
	LD GP3, GP0, #-8
	MOV GP2, GP3
	MUL GP2, GP4
	AMOV GP2
	SHRI GP2, #3
	MULI GP2, #10
	SUB GP3, GP2
	ORI GP3, #48
	STB GP3, GP0, #-1
	MOV GP24, GP0
	SUBI GP24, #1
	LLI GP23, #1
	MOV GP25, GP23
	CALLI sc32_write
SLBB4_20:                                ; %if.end.9
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
sc32_readline:                          ; -- Begin function sc32_readline
                                        ; @sc32_readline
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #44
	LLI GP23, #16
	ST GP23, GP0, #-28
	CALLI malloc
	LLI GP23, #0
	MOV GP2, GP0
	SUBI GP2, #2
	ST GP2, GP0, #-32
	LLI GP25, #1
	LLI GP2, #13
	ST GP2, GP0, #-36
	MOV GP2, GP0
	SUBI GP2, #1
	ST GP2, GP0, #-40
	LLI GP2, #10
	ST GP2, GP0, #-44
	ST GP23, GP0, #-16
	ST GP23, GP0, #-24
	ST GP25, GP0, #-12
	JMP SLBB5_1
SLBB5_6:                                 ; %if.then8
                                        ;   in Loop: Header=BB5_1 Depth=1
	ADDI GP24, #16
	LD GP23, GP0, #-8
	ST GP24, GP0, #-28
	CALLI realloc
	LD GP3, GP0, #-20
	ST GP28, GP0, #-8
SLBB5_7:                                 ; %if.end10
                                        ;   in Loop: Header=BB5_1 Depth=1
	LD GP23, GP0, #-12
	STB GP3, GP0, #-1
	LD GP24, GP0, #-40
	LD GP25, GP0, #-12
	CALLI sc32_write
	LD GP25, GP0, #-12
	LD GP28, GP0, #-8
	MOV GP2, GP28
	LD GP3, GP0, #-16
	ADD GP2, GP3
	LD GP4, GP0, #-20
	STB GP4, GP2, #0
	ADDI GP3, #1
	ST GP3, GP0, #-16
	LD GP23, GP0, #-24
	CMP GP4, GP23
	JEQ SLBB5_8
SLBB5_1:                                 ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	ST GP28, GP0, #-8
	LD GP24, GP0, #-32
	CALLI sc32_read
	LDB GP3, GP0, #-2
	LD GP2, GP0, #-36
	CMP GP3, GP2
	JEQ SLBB5_3
SLBB5_2:                                 ; %do.body
                                        ;   in Loop: Header=BB5_1 Depth=1
	LD GP2, GP0, #-44
	CMP GP3, GP2
	JNE SLBB5_4
SLBB5_3:                                 ; %if.then
                                        ;   in Loop: Header=BB5_1 Depth=1
	LD GP3, GP0, #-24
SLBB5_4:                                 ; %if.end
                                        ;   in Loop: Header=BB5_1 Depth=1
	LD GP24, GP0, #-28
	LD GP2, GP0, #-16
	CMP GP2, GP24
	ST GP3, GP0, #-20
	JGEU SLBB5_6
SLBB5_5:                                 ;   in Loop: Header=BB5_1 Depth=1
	LD GP2, GP0, #-8
	JMP SLBB5_7
SLBB5_8:                                 ; %do.end
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
	SECTION .rodata.sstr1.1
__const.sc32_print_hex.hex:             ; @__const.sc32_print_hex.hex
	DB 48
	DB 49
	DB 50
	DB 51
	DB 52
	DB 53
	DB 54
	DB 55
	DB 56
	DB 57
	DB 65
	DB 66
	DB 67
	DB 68
	DB 69
	DB 70
	DB 0

.sstr:                                   ; @.sstr
	DB 48
	DB 120
	DB 0

