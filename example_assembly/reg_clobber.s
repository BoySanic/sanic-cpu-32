	SECTION .main
main:                                   ; -- Begin function main
                                        ; @main
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #8
	LLI GP2, #65
	STB GP2, GP0, #-3
	MOV GP23, GP0
	SUBI GP23, #3
	LLI GP2, #66
	STB GP2, GP23, #1
	LLI GP2, #0
	ST GP2, GP0, #-8
	STB GP2, GP23, #2
	CALLI sc32_prints
	LD GP28, GP0, #-8
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
