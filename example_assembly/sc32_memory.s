	SECTION .text
memset:                                 ; -- Begin function memset
                                        ; @memset
; %bb.0:                                ; %entry
	LLI GP2, #0
	CMP GP25, GP2
	JEQ MEMLBB0_3
MEMLBB0_1:                                 ; %while.body.lr.ph
	LUI GP3, #1048575
	ORI GP3, #1048575
	MOV GP4, GP23
MEMLBB0_2:                                 ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	STB GP24, GP4, #0
	ADD GP25, GP3
	ADDI GP4, #1
	CMP GP25, GP2
	JNE MEMLBB0_2
MEMLBB0_3:                                 ; %while.end
	MOV GP28, GP23
	RET
                                        ; -- End function
memcpy:                                 ; -- Begin function memcpy
                                        ; @memcpy
; %bb.0:                                ; %entry
	LLI GP2, #0
	CMP GP25, GP2
	JEQ MEMLBB1_3
MEMLBB1_1:                                 ; %while.body.preheader
	LUI GP3, #1048575
	ORI GP3, #1048575
	MOV GP4, GP23
MEMLBB1_2:                                 ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	LDB GP5, GP24, #0
	STB GP5, GP4, #0
	ADD GP25, GP3
	ADDI GP4, #1
	ADDI GP24, #1
	CMP GP25, GP2
	JNE MEMLBB1_2
MEMLBB1_3:                                 ; %while.end
	MOV GP28, GP23
	RET
                                        ; -- End function
