	SECTION .text
sbrk:                                   ; -- Begin function sbrk
                                        ; @sbrk
; %bb.0:                                ; %entry
	LUI GP2, heap
	ORI GP2, heap
	LD GP28, GP2, #0
	MOV GP3, GP28
	ADD GP3, GP23
	ST GP3, GP2, #0
	RET
                                        ; -- End function
sc32_putc:                              ; -- Begin function sc32_putc
                                        ; @sc32_putc
; %bb.0:                                ; %entry
	LUI GP2, #1024
	ORI GP2, #1
	STB GP23, GP2, #0
	RET
                                        ; -- End function
sc32_prints:                            ; -- Begin function sc32_prints
                                        ; @sc32_prints
; %bb.0:                                ; %entry
	LLI GP2, #0
	LUI GP3, #1024
	ORI GP3, #1
	MOV GP4, GP2
XLBB2_1:                                 ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	MOV GP5, GP23
	ADD GP5, GP4
	LDB GP5, GP5, #0
	STB GP5, GP3, #0
	ADDI GP4, #1
	CMP GP5, GP2
	JNE XLBB2_1
XLBB2_2:                                 ; %while.end
	RET
                                        ; -- End function
get_input:                              ; -- Begin function get_input
                                        ; @get_input
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #28
	LLI GP23, #16
	ST GP23, GP0, #-4
	CALLI malloc
	LD GP24, GP0, #-4
	LLI GP4, #0
	LUI GP5, #1024
	MOV GP6, GP5
	ORI GP6, #1
	ORI GP5, #2
	LLI GP7, #10
	MOV GP3, GP4
	ST GP4, GP0, #-16
	ST GP5, GP0, #-20
	ST GP6, GP0, #-24
	ST GP7, GP0, #-28
	JMP XLBB3_1
XLBB3_2:                                 ;   in Loop: Header=BB3_1 Depth=1
	CMP GP8, GP7
	JEQ XLBB3_8
XLBB3_1:                                 ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	LDB GP8, GP5, #0
	STB GP8, GP6, #0
	CMP GP8, GP4
	JEQ XLBB3_2
XLBB3_3:                                 ; %if.then
                                        ;   in Loop: Header=BB3_1 Depth=1
	CMP GP3, GP24
	JNE XLBB3_4
XLBB3_5:                                 ; %if.then7
                                        ;   in Loop: Header=BB3_1 Depth=1
	MOV GP24, GP3
	ADDI GP24, #16
	ST GP24, GP0, #-4
	MOV GP23, GP28
	ST GP3, GP0, #-8
	ST GP8, GP0, #-12
	CALLI realloc
	LD GP8, GP0, #-12
	LD GP7, GP0, #-28
	LD GP6, GP0, #-24
	LD GP5, GP0, #-20
	LD GP4, GP0, #-16
	LD GP24, GP0, #-4
	LD GP3, GP0, #-8
	JMP XLBB3_6
XLBB3_4:                                 ;   in Loop: Header=BB3_1 Depth=1
XLBB3_6:                                 ; %if.end
                                        ;   in Loop: Header=BB3_1 Depth=1
	MOV GP2, GP28
	ADD GP2, GP3
	STB GP8, GP2, #0
	ADDI GP3, #1
	CMP GP8, GP7
	JNE XLBB3_1
XLBB3_8:                                 ; %while.end
	CMP GP3, GP24
	JNE XLBB3_9
XLBB3_10:                                ; %if.then12
	ADDI GP24, #1
	MOV GP23, GP28
	ST GP3, GP0, #-8
	CALLI realloc
	LD GP3, GP0, #-8
	JMP XLBB3_11
XLBB3_9:
XLBB3_11:                                ; %if.end15
	MOV GP2, GP28
	ADD GP2, GP3
	LLI GP3, #0
	STB GP3, GP2, #0
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
	SUBI GP29, #32
	LLI GP2, #16
	ST GP2, GP0, #-32
	LLI GP4, #0
	LUI GP2, #1024
	MOV GP5, GP2
	ORI GP5, #1
	ORI GP2, #2
	ST GP2, GP0, #-28
	LLI GP6, #10
	ST GP4, GP0, #-16
	ST GP5, GP0, #-20
	ST GP6, GP0, #-24
XLBB4_1:                                 ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_2 Depth 2
                                        ;     Child Loop BB4_13 Depth 2
	LD GP23, GP0, #-32
	CALLI malloc
	LD GP6, GP0, #-24
	LD GP5, GP0, #-20
	LD GP4, GP0, #-16
	MOV GP7, GP4
	LD GP24, GP0, #-32
	LD GP3, GP0, #-28
	JMP XLBB4_2
XLBB4_3:                                 ;   in Loop: Header=BB4_2 Depth=2
	CMP GP8, GP6
	JEQ XLBB4_9
XLBB4_2:                                 ; %while.body.i
                                        ;   Parent Loop BB4_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LDB GP8, GP3, #0
	STB GP8, GP5, #0
	CMP GP8, GP4
	JEQ XLBB4_3
XLBB4_4:                                 ; %if.then.i
                                        ;   in Loop: Header=BB4_2 Depth=2
	CMP GP7, GP24
	JNE XLBB4_5
XLBB4_6:                                 ; %if.then7.i
                                        ;   in Loop: Header=BB4_2 Depth=2
	MOV GP24, GP7
	ADDI GP24, #16
	ST GP24, GP0, #-12
	MOV GP23, GP28
	ST GP7, GP0, #-4
	ST GP8, GP0, #-8
	CALLI realloc
	LD GP8, GP0, #-8
	LD GP24, GP0, #-12
	LD GP7, GP0, #-4
	LD GP6, GP0, #-24
	LD GP5, GP0, #-20
	LD GP3, GP0, #-28
	LD GP4, GP0, #-16
	JMP XLBB4_7
XLBB4_5:                                 ;   in Loop: Header=BB4_2 Depth=2
XLBB4_7:                                 ; %if.end.i
                                        ;   in Loop: Header=BB4_2 Depth=2
	MOV GP2, GP28
	ADD GP2, GP7
	STB GP8, GP2, #0
	ADDI GP7, #1
	CMP GP8, GP6
	JNE XLBB4_2
XLBB4_9:                                 ; %while.end.i
                                        ;   in Loop: Header=BB4_1 Depth=1
	CMP GP7, GP24
	JNE XLBB4_10
XLBB4_11:                                ; %if.then12.i
                                        ;   in Loop: Header=BB4_1 Depth=1
	ADDI GP24, #1
	MOV GP23, GP28
	ST GP7, GP0, #-4
	CALLI realloc
	LD GP7, GP0, #-4
	LD GP6, GP0, #-24
	LD GP5, GP0, #-20
	LD GP4, GP0, #-16
	JMP XLBB4_12
XLBB4_10:                                ;   in Loop: Header=BB4_1 Depth=1
XLBB4_12:                                ; %get_input.exit
                                        ;   in Loop: Header=BB4_1 Depth=1
	MOV GP2, GP28
	ADD GP2, GP7
	STB GP4, GP2, #0
	MOV GP2, GP4
XLBB4_13:                                ; %while.body.i1
                                        ;   Parent Loop BB4_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	MOV GP3, GP28
	ADD GP3, GP2
	LDB GP3, GP3, #0
	STB GP3, GP5, #0
	ADDI GP2, #1
	CMP GP3, GP4
	JNE XLBB4_13
	JMP XLBB4_1
                                        ; -- End function
	SECTION .data
	ALIGN 4                          ; @heap
heap:
	DD	8389632

