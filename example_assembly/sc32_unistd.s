	SECTION .text
__errno_location:                       ; -- Begin function __errno_location
                                        ; @__errno_location
; %bb.0:                                ; %entry
	LUI GP2, my_errno
	ORI GP2, my_errno
	LD GP28, GP2, #0
	RET
                                        ; -- End function
sbrk:                                   ; -- Begin function sbrk
                                        ; @sbrk
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #16
	ST GP23, GP0, #-8
	LUI GP23, .ustr
	ORI GP23, .ustr
	LUI GP2, heap
	ORI GP2, heap
	ST GP2, GP0, #-12
	LD GP2, GP2, #0
	ST GP2, GP0, #-4
	CALLI sc32_prints
	LD GP23, GP0, #-4
	CALLI sc32_print_hex
	LLI GP23, #10
	ST GP23, GP0, #-16
	CALLI sc32_putc
	LUI GP23, .ustr.1
	ORI GP23, .ustr.1
	CALLI sc32_prints
	LD GP23, GP0, #-8
	CALLI sc32_print_dec
	LD GP23, GP0, #-16
	CALLI sc32_putc
	LD GP4, GP0, #-12
	LD GP2, GP4, #0
	LD GP3, GP0, #-8
	ADD GP2, GP3
	LUI GP3, #4031
	ORI GP3, #786431
	CMP GP2, GP3
	JGTU uLLB1_2
uLLB1_1:                                 ; %entry
	LUI GP3, #2048
	ORI GP3, #4095
	CMP GP2, GP3
	JLEU uLLB1_2
uLLB1_3:                                 ; %if.end
	ST GP2, GP4, #0
	LUI GP23, .ustr.3
	ORI GP23, .ustr.3
	CALLI sc32_prints
	LD GP23, GP0, #-4
	CALLI sc32_print_hex
	LLI GP23, #10
	CALLI sc32_putc
	LD GP28, GP0, #-4
	MOV GP29, GP0
	POP GP0
	RET
uLLB1_2:                                 ; %if.then
	LUI GP23, .ustr.2
	ORI GP23, .ustr.2
	CALLI sc32_prints
	LUI GP28, #1048575
	ORI GP28, #1048575
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
sc32_write:                             ; -- Begin function sc32_write
                                        ; @sc32_write
; %bb.0:                                ; %entry
	LUI GP28, #1048575
	MOV GP2, GP28
	ORI GP2, #1048573
	ADD GP23, GP2
	MOV GP2, GP28
	ORI GP2, #1048574
	CMP GP23, GP2
	JGEU uLLB2_2
uLLB2_1:
	ORI GP28, #1048575
	RET
uLLB2_2:                                 ; %for.cond.preheader
	LLI GP28, #0
	CMP GP25, GP28
	JEQ uLLB2_6
uLLB2_3:                                 ; %for.body.preheader
	LLI GP2, #0
	LUI GP3, #1024
	ORI GP3, #1
uLLB2_4:                                 ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	MOV GP4, GP24
	ADD GP4, GP2
	LDB GP4, GP4, #0
	STB GP4, GP3, #0
	ADDI GP2, #1
	CMP GP2, GP25
	JLTU uLLB2_4
uLLB2_5:
	MOV GP28, GP25
uLLB2_6:                                 ; %return
	RET
                                        ; -- End function
sc32_read:                              ; -- Begin function sc32_read
                                        ; @sc32_read
; %bb.0:                                ; %entry
	LLI GP28, #0
	CMP GP23, GP28
	JEQ uLLB3_2
uLLB3_1:
	LUI GP28, #1048575
	ORI GP28, #1048575
	RET
uLLB3_2:                                 ; %for.cond.preheader
	CMP GP25, GP28
	JEQ uLLB3_7
uLLB3_3:                                 ; %while.cond.preheader.preheader
	LLI GP2, #0
	LUI GP3, #1024
	ORI GP3, #2
	MOV GP4, GP2
uLLB3_4:                                 ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	LDB GP5, GP3, #0
	CMP GP5, GP2
	JEQ uLLB3_4
uLLB3_5:                                 ; %while.end
                                        ;   in Loop: Header=BB3_4 Depth=1
	MOV GP6, GP24
	ADD GP6, GP4
	STB GP5, GP6, #0
	ADDI GP4, #1
	CMP GP4, GP25
	JLTU uLLB3_4
uLLB3_6:
	MOV GP28, GP25
uLLB3_7:                                 ; %return
	RET
                                        ; -- End function
sc32_read_clock:                        ; -- Begin function sc32_read_clock
                                        ; @sc32_read_clock
; %bb.0:                                ; %entry
	LUI GP2, #1024
	ORI GP2, #3
	LD GP28, GP2, #0
	RET
                                        ; -- End function
	SECTION .data
  ALIGN 4
my_errno:
	DD	8388863
  ALIGN 4
heap:
	DD	8392704

	SECTION .rodata.ustr1.1
.ustr:                                   ; @.ustr
	DB 115
	DB 98
	DB 114
	DB 107
	DB 32
	DB 99
	DB 97
	DB 108
	DB 108
	DB 101
	DB 100
	DB 44
	DB 32
	DB 111
	DB 108
	DB 100
	DB 95
	DB 104
	DB 101
	DB 97
	DB 112
	DB 58
	DB 32
	DB 0

.ustr.1:                                 ; @.ustr.1
	DB 115
	DB 98
	DB 114
	DB 107
	DB 32
	DB 114
	DB 101
	DB 113
	DB 117
	DB 101
	DB 115
	DB 116
	DB 101
	DB 100
	DB 58
	DB 32
	DB 0

.ustr.2:                                 ; @.ustr.2
	DB 115
	DB 98
	DB 114
	DB 107
	DB 32
	DB 82
	DB 69
	DB 74
	DB 69
	DB 67
	DB 84
	DB 69
	DB 68
	DB 32
	DB 116
	DB 104
	DB 101
	DB 32
	DB 97
	DB 108
	DB 108
	DB 111
	DB 99
	DB 97
	DB 116
	DB 105
	DB 111
	DB 110
	DB 33
	DB 10
	DB 0

.ustr.3:                                 ; @.ustr.3
	DB 115
	DB 98
	DB 114
	DB 107
	DB 32
	DB 82
	DB 101
	DB 116
	DB 117
	DB 114
	DB 110
	DB 101
	DB 100
	DB 32
	DB 112
	DB 111
	DB 105
	DB 110
	DB 116
	DB 101
	DB 114
	DB 58
	DB 32
	DB 0

