	SECTION .text
malloc:                                 ; -- Begin function malloc
                                        ; @malloc
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #68
	ST GP23, GP0, #-4
	CALLI get_malloc_state
	LD GP23, GP0, #-4
	LUI GP10, #1048575
	MOV GP2, GP10
	ORI GP2, #1048544
	CMP GP23, GP2
	JLTU LBB0_2
LBB0_1:                                 ; %if.then
	CALLI __errno_location
	LLI GP2, #12
	ST GP2, GP28, #0
	LLI GP8, #0
	JMP LBB0_20
LBB0_2:                                 ; %if.end
	MOV GP24, GP28
	MOV GP13, GP10
	ORI GP13, #1048568
	LLI GP2, #5
	CMP GP23, GP2
	JLTU LBB0_4
LBB0_3:                                 ; %if.end
	ADDI GP23, #11
	AND GP23, GP13
	JMP LBB0_5
LBB0_4:
	LLI GP23, #16
LBB0_5:                                 ; %if.end
	LD GP4, GP24, #0
	MOV GP2, GP4
	ANDI GP2, #1
	LLI GP12, #0
	CMP GP2, GP12
	ST GP23, GP0, #-4
	ST GP24, GP0, #-8
	JNE LBB0_10
LBB0_6:                                 ; %if.then7
	LLI GP2, #0
	CMP GP4, GP2
	JNE LBB0_8
LBB0_7:                                 ; %if.then10
	MOV GP23, GP24
	ST GP10, GP0, #-56
	CALLI malloc_consolidate
	LD GP10, GP0, #-56
	LD GP24, GP0, #-8
	LD GP23, GP0, #-4
LBB0_8:                                 ; %use_top
	ORI GP10, #1048572
	LD GP8, GP24, #44
	LD GP2, GP8, #4
	AND GP2, GP10
	MOV GP3, GP23
	ADDI GP3, #16
	CMP GP2, GP3
	JGEU LBB0_18
LBB0_9:                                 ; %if.end289
	CALLI sYSMALLOc
	MOV GP8, GP28
	JMP LBB0_20
LBB0_10:                                ; %if.end12
	CMP GP23, GP4
	JGTU LBB0_13
LBB0_11:                                ; %if.then15
	MOV GP3, GP10
	ORI GP3, #1048572
	MOV GP2, GP28
	ADD GP2, GP3
	MOV GP3, GP23
	SHRI GP3, #1
	ADD GP2, GP3
	LD GP8, GP2, #0
	CMP GP8, GP12
	JEQ LBB0_13
LBB0_12:                                ; %if.then17
	LD GP3, GP8, #8
	ST GP3, GP2, #0
	JMP LBB0_19
LBB0_13:                                ; %if.end19
	LLI GP2, #256
	CMP GP23, GP2
	JGEU LBB0_15
LBB0_14:
	LLI GP12, #1
LBB0_15:                                ; %if.end19
	LLI GP7, #255
	CMP GP23, GP7
	ST GP12, GP0, #-24
	ST GP7, GP0, #-20
	ST GP28, GP0, #-60
	ST GP13, GP0, #-28
	JGTU LBB0_21
LBB0_16:                                ; %if.then21
	MOV GP2, GP28
	ADD GP2, GP23
	LD GP8, GP2, #56
	MOV GP3, GP2
	ADDI GP3, #44
	CMP GP8, GP3
	JEQ LBB0_25
LBB0_17:                                ; %if.then26
	MOV GP4, GP8
	ADD GP4, GP23
	LD GP5, GP4, #4
	ORI GP5, #1
	LD GP6, GP8, #12
	ST GP5, GP4, #4
	ST GP6, GP2, #56
	ST GP3, GP6, #8
	JMP LBB0_19
LBB0_18:                                ; %if.then280
	MOV GP3, GP8
	ADD GP3, GP23
	ST GP3, GP24, #44
	SUB GP2, GP23
	ORI GP23, #1
	ST GP23, GP8, #4
	ORI GP2, #1
	ST GP2, GP3, #4
LBB0_19:                                ; %cleanup
	ADDI GP8, #8
LBB0_20:                                ; %cleanup
	MOV GP28, GP8
	MOV GP29, GP0
	POP GP0
	RET
LBB0_21:                                ; %if.else
	ST GP10, GP0, #-56
	ST GP4, GP0, #-12
	CALLI largebin_index
	ST GP28, GP0, #-68
	LD GP3, GP0, #-12
	ANDI GP3, #2
	LLI GP2, #0
	CMP GP3, GP2
	JNE LBB0_23
LBB0_22:
	LD GP23, GP0, #-4
	LD GP24, GP0, #-8
	JMP LBB0_24
LBB0_23:                                ; %if.then38
	LD GP23, GP0, #-8
	CALLI malloc_consolidate
	LD GP24, GP0, #-8
	LD GP23, GP0, #-4
LBB0_24:                                ; %if.end40
	LD GP28, GP0, #-60
	LD GP12, GP0, #-24
	LD GP13, GP0, #-28
	LD GP7, GP0, #-20
	JMP LBB0_26
LBB0_25:
	ST GP10, GP0, #-56
	MOV GP2, GP23
	SHRI GP2, #3
	ST GP2, GP0, #-68
	LD GP24, GP0, #-8
LBB0_26:                                ; %if.end40
	LD GP8, GP24, #64
	MOV GP14, GP28
	ADDI GP14, #52
	CMP GP8, GP14
	JEQ LBB0_45
LBB0_27:                                ; %while.body.lr.ph
	LD GP9, GP0, #-60
	ADDI GP9, #820
	MOV GP2, GP23
	ADDI GP2, #16
	ST GP2, GP0, #-64
	LLI GP10, #0
	LLI GP11, #1
	LD GP15, GP0, #-56
	ORI GP15, #1048572
	LUI GP16, #131071
	ORI GP16, #1048572
	ST GP14, GP0, #-52
	ST GP9, GP0, #-32
	ST GP10, GP0, #-36
	ST GP11, GP0, #-40
	ST GP15, GP0, #-44
	ST GP16, GP0, #-48
	JMP LBB0_30
LBB0_28:                                ; %if.then102
                                        ;   in Loop: Header=BB0_30 Depth=1
	MOV GP2, GP28
	ANDI GP2, #248
	MOV GP3, GP14
	ADD GP3, GP2
	SHRI GP28, #3
	LD GP2, GP3, #0
	ADD GP3, GP13
LBB0_29:                                ; %if.end136
                                        ;   in Loop: Header=BB0_30 Depth=1
	MOV GP4, GP28
	ANDI GP4, #31
	MOV GP5, GP11
	SHL GP5, GP4
	SHRI GP28, #3
	AND GP28, GP16
	MOV GP4, GP9
	ADD GP4, GP28
	LD GP6, GP4, #0
	OR GP6, GP5
	ST GP6, GP4, #0
	ST GP2, GP8, #8
	ST GP3, GP8, #12
	ST GP8, GP2, #12
	ST GP8, GP3, #8
	LD GP8, GP24, #64
	CMP GP8, GP14
	JEQ LBB0_45
LBB0_30:                                ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_42 Depth 2
	LD GP2, GP8, #12
	CMP GP2, GP14
	MOV GP3, GP11
	JEQ LBB0_32
LBB0_31:                                ; %while.body
                                        ;   in Loop: Header=BB0_30 Depth=1
	MOV GP3, GP10
LBB0_32:                                ; %while.body
                                        ;   in Loop: Header=BB0_30 Depth=1
	MOV GP4, GP12
	AND GP4, GP3
	LD GP28, GP8, #4
	MOV GP5, GP28
	AND GP5, GP15
	ANDI GP4, #1
	CMP GP4, GP10
	JEQ LBB0_35
LBB0_33:                                ; %land.lhs.true57
                                        ;   in Loop: Header=BB0_30 Depth=1
	LD GP3, GP24, #48
	CMP GP8, GP3
	JNE LBB0_35
LBB0_34:                                ; %land.lhs.true57
                                        ;   in Loop: Header=BB0_30 Depth=1
	LD GP3, GP0, #-64
	CMP GP5, GP3
	JGTU LBB0_63
LBB0_35:                                ; %if.end85
                                        ;   in Loop: Header=BB0_30 Depth=1
	ST GP2, GP24, #64
	ST GP14, GP2, #8
	CMP GP5, GP23
	JEQ LBB0_61
LBB0_36:                                ; %if.end100
                                        ;   in Loop: Header=BB0_30 Depth=1
	CMP GP28, GP7
	JLEU LBB0_28
LBB0_37:                                ; %if.else109
                                        ;   in Loop: Header=BB0_30 Depth=1
	ST GP8, GP0, #-12
	MOV GP23, GP5
	ST GP5, GP0, #-16
	CALLI largebin_index
	LD GP14, GP0, #-52
	LD GP13, GP0, #-28
	MOV GP2, GP28
	SHLI GP2, #3
	MOV GP4, GP14
	ADD GP4, GP2
	MOV GP3, GP4
	ADD GP3, GP13
	LD GP2, GP4, #0
	CMP GP2, GP3
	JEQ LBB0_40
LBB0_38:                                ; %if.then117
                                        ;   in Loop: Header=BB0_30 Depth=1
	LD GP4, GP4, #4
	LD GP5, GP4, #4
	LD GP6, GP0, #-16
	CMP GP6, GP5
	LD GP24, GP0, #-8
	LD GP12, GP0, #-24
	LD GP8, GP0, #-12
	LD GP9, GP0, #-32
	LD GP10, GP0, #-36
	LD GP11, GP0, #-40
	LD GP15, GP0, #-44
	LD GP16, GP0, #-48
	MOV GP5, GP6
	JGEU LBB0_41
LBB0_39:                                ;   in Loop: Header=BB0_30 Depth=1
	MOV GP2, GP3
	MOV GP3, GP4
	LD GP23, GP0, #-4
	LD GP7, GP0, #-20
	JMP LBB0_29
LBB0_40:                                ;   in Loop: Header=BB0_30 Depth=1
	LD GP23, GP0, #-4
	LD GP24, GP0, #-8
	LD GP12, GP0, #-24
	LD GP8, GP0, #-12
	LD GP7, GP0, #-20
	LD GP9, GP0, #-32
	LD GP10, GP0, #-36
	LD GP11, GP0, #-40
	LD GP15, GP0, #-44
	LD GP16, GP0, #-48
	JMP LBB0_29
LBB0_41:                                ; %if.then125
                                        ;   in Loop: Header=BB0_30 Depth=1
	ORI GP5, #1
	LD GP3, GP2, #4
	CMP GP5, GP3
	LD GP23, GP0, #-4
	LD GP7, GP0, #-20
	JGEU LBB0_44
LBB0_42:                                ; %while.body130
                                        ;   Parent Loop BB0_30 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LD GP2, GP2, #8
	LD GP3, GP2, #4
	CMP GP5, GP3
	JLTU LBB0_42
LBB0_44:                                ; %while.end
                                        ;   in Loop: Header=BB0_30 Depth=1
	LD GP3, GP2, #12
	JMP LBB0_29
LBB0_45:                                ; %while.end146
	ANDI GP12, #1
	LLI GP2, #0
	CMP GP12, GP2
	LD GP10, GP0, #-56
	LD GP11, GP0, #-60
	LD GP15, GP0, #-68
	JNE LBB0_50
LBB0_46:                                ; %if.then148
	MOV GP3, GP15
	SHLI GP3, #3
	MOV GP5, GP14
	ADD GP5, GP3
	LD GP3, GP5, #4
	ADD GP5, GP13
	CMP GP3, GP5
	JEQ LBB0_50
LBB0_47:                                ; %for.body.preheader
	MOV GP6, GP10
	ORI GP6, #1048572
LBB0_48:                                ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	LD GP4, GP3, #4
	AND GP4, GP6
	CMP GP4, GP23
	JGEU LBB0_64
LBB0_49:                                ; %for.inc
                                        ;   in Loop: Header=BB0_48 Depth=1
	LD GP3, GP3, #12
	CMP GP3, GP5
	JNE LBB0_48
LBB0_50:                                ; %if.end194
	ADDI GP15, #1
	MOV GP3, GP15
	SHLI GP3, #3
	MOV GP5, GP14
	ADD GP5, GP3
	MOV GP4, GP15
	ANDI GP4, #31
	LLI GP3, #1
	MOV GP7, GP3
	SHL GP7, GP4
	ADD GP5, GP13
	ADDI GP11, #820
	SHRI GP15, #5
	MOV GP4, GP15
	SHLI GP4, #2
	MOV GP6, GP11
	ADD GP6, GP4
	LD GP6, GP6, #0
	MOV GP4, GP10
	ORI GP4, #1048575
LBB0_51:                                ; %for.cond204
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_53 Depth 2
                                        ;     Child Loop BB0_58 Depth 2
	MOV GP8, GP7
	ADD GP8, GP4
	CMP GP8, GP6
	JGEU LBB0_53
LBB0_52:                                ;   in Loop: Header=BB0_51 Depth=1
	JMP LBB0_56
LBB0_53:                                ; %do.body
                                        ;   Parent Loop BB0_51 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	CMP GP15, GP3
	JGTU LBB0_8
LBB0_54:                                ; %do.cond
                                        ;   in Loop: Header=BB0_53 Depth=2
	ADDI GP15, #1
	MOV GP5, GP15
	SHLI GP5, #2
	MOV GP6, GP11
	ADD GP6, GP5
	LD GP6, GP6, #0
	CMP GP6, GP2
	JEQ LBB0_53
LBB0_55:                                ; %do.end
                                        ;   in Loop: Header=BB0_51 Depth=1
	MOV GP7, GP15
	SHLI GP7, #8
	MOV GP5, GP14
	ADD GP5, GP7
	ADD GP5, GP13
	MOV GP7, GP3
LBB0_56:                                ; %if.end220
                                        ;   in Loop: Header=BB0_51 Depth=1
	MOV GP8, GP7
	AND GP8, GP6
	CMP GP8, GP2
	JEQ LBB0_58
LBB0_57:                                ;   in Loop: Header=BB0_51 Depth=1
	JMP LBB0_59
LBB0_58:                                ; %while.body224
                                        ;   Parent Loop BB0_51 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	SHLI GP7, #1
	MOV GP8, GP7
	AND GP8, GP6
	ADDI GP5, #8
	CMP GP8, GP2
	JEQ LBB0_58
LBB0_59:                                ; %while.end227
                                        ;   in Loop: Header=BB0_51 Depth=1
	LD GP8, GP5, #12
	CMP GP8, GP5
	JNE LBB0_67
LBB0_60:                                ; %if.then230
                                        ;   in Loop: Header=BB0_51 Depth=1
	MOV GP8, GP15
	SHLI GP8, #2
	MOV GP9, GP11
	ADD GP9, GP8
	MOV GP8, GP7
	XOR GP8, GP4
	AND GP6, GP8
	ST GP6, GP9, #0
	SHLI GP7, #1
	ADDI GP5, #8
	JMP LBB0_51
LBB0_61:                                ; %if.then95
	MOV GP2, GP8
	ADD GP2, GP5
LBB0_62:                                ; %cleanup
	LD GP3, GP2, #4
	ORI GP3, #1
	ST GP3, GP2, #4
	JMP LBB0_19
LBB0_63:                                ; %if.then62
	MOV GP2, GP8
	ADD GP2, GP23
	ST GP2, GP24, #64
	ST GP2, GP24, #60
	ST GP2, GP24, #48
	ST GP14, GP2, #12
	ST GP14, GP2, #8
	MOV GP3, GP8
	ADD GP3, GP5
	SUB GP5, GP23
	ORI GP23, #1
	ST GP23, GP8, #4
	MOV GP4, GP5
	ORI GP4, #1
	ST GP4, GP2, #4
	ST GP5, GP3, #0
	JMP LBB0_19
LBB0_64:                                ; %if.then158
	LD GP2, GP3, #12
	LD GP5, GP3, #8
	ST GP2, GP5, #12
	ST GP5, GP2, #8
	MOV GP2, GP4
	SUB GP2, GP23
	MOV GP8, GP3
	ADDI GP8, #8
	LLI GP5, #15
	CMP GP2, GP5
	JGTU LBB0_66
LBB0_65:                                ; %if.then165
	ADD GP3, GP4
	LD GP2, GP3, #4
	ORI GP2, #1
	ST GP2, GP3, #4
	JMP LBB0_20
LBB0_66:                                ; %if.else170
	MOV GP5, GP3
	ADD GP5, GP23
	ST GP5, GP24, #64
	ST GP5, GP24, #60
	ST GP14, GP5, #12
	ST GP14, GP5, #8
	ORI GP23, #1
	ST GP23, GP3, #4
	MOV GP6, GP2
	ORI GP6, #1
	ST GP6, GP5, #4
	ADD GP3, GP4
	ST GP2, GP3, #0
	JMP LBB0_20
LBB0_67:                                ; %if.else236
	LD GP3, GP8, #4
	LD GP4, GP8, #12
	ST GP4, GP5, #12
	ST GP5, GP4, #8
	ORI GP10, #1048572
	AND GP3, GP10
	MOV GP4, GP3
	SUB GP4, GP23
	LLI GP5, #15
	CMP GP4, GP5
	JGTU LBB0_69
LBB0_68:                                ; %if.then244
	MOV GP2, GP8
	ADD GP2, GP3
	JMP LBB0_62
LBB0_69:                                ; %if.else249
	MOV GP5, GP8
	ADD GP5, GP23
	ST GP5, GP24, #64
	ST GP5, GP24, #60
	ST GP14, GP5, #12
	ST GP14, GP5, #8
	CMP GP12, GP2
	JEQ LBB0_71
LBB0_70:                                ; %if.then265
	ST GP5, GP24, #48
LBB0_71:                                ; %if.end267
	ORI GP23, #1
	ST GP23, GP8, #4
	MOV GP2, GP4
	ORI GP2, #1
	ST GP2, GP5, #4
	MOV GP2, GP8
	ADD GP2, GP3
	ST GP4, GP2, #0
	JMP LBB0_19
                                        ; -- End function
get_malloc_state:                       ; -- Begin function get_malloc_state
                                        ; @get_malloc_state
; %bb.0:                                ; %entry
	LUI GP2, av_
	ORI GP2, av_
	LD GP28, GP2, #0
	RET
                                        ; -- End function
malloc_consolidate:                     ; -- Begin function malloc_consolidate
                                        ; @malloc_consolidate
; %bb.0:                                ; %entry
	LD GP4, GP23, #0
	LLI GP2, #0
	CMP GP4, GP2
	JEQ LBB2_15
LBB2_1:                                 ; %if.then
	LUI GP3, #524287
	ORI GP3, #1048572
	MOV GP6, GP4
	SHRI GP6, #1
	AND GP6, GP3
	LUI GP3, #1048575
	MOV GP5, GP3
	ORI GP5, #1048573
	AND GP4, GP5
	ST GP4, GP23, #0
	MOV GP4, GP23
	ADDI GP4, #4
	MOV GP5, GP4
	ADD GP5, GP6
	MOV GP6, GP3
	ORI GP6, #1048568
	ADD GP5, GP6
	MOV GP6, GP23
	ADDI GP6, #52
	MOV GP7, GP3
	ORI GP7, #1048574
	ORI GP3, #1048572
	JMP LBB2_2
LBB2_14:                                ; %do.cond51
                                        ;   in Loop: Header=BB2_2 Depth=1
	MOV GP8, GP4
	ADDI GP8, #4
	CMP GP4, GP5
	MOV GP4, GP8
	JEQ LBB2_16
LBB2_2:                                 ; %do.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_4 Depth 2
	LD GP8, GP4, #0
	CMP GP8, GP2
	JEQ LBB2_14
LBB2_3:                                 ; %if.then7
                                        ;   in Loop: Header=BB2_2 Depth=1
	ST GP2, GP4, #0
	LD GP9, GP23, #44
	JMP LBB2_4
LBB2_12:                                ; %if.else
                                        ;   in Loop: Header=BB2_4 Depth=2
	ADD GP11, GP12
	ORI GP11, #1
	ST GP11, GP8, #4
	ST GP8, GP23, #44
	MOV GP9, GP8
LBB2_13:                                ; %do.cond
                                        ;   in Loop: Header=BB2_4 Depth=2
	CMP GP10, GP2
	MOV GP8, GP10
	JEQ LBB2_14
LBB2_4:                                 ; %do.body8
                                        ;   Parent Loop BB2_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	LD GP11, GP8, #4
	MOV GP14, GP11
	AND GP14, GP7
	MOV GP13, GP8
	ADD GP13, GP14
	LD GP12, GP13, #4
	LD GP10, GP8, #8
	ANDI GP11, #1
	CMP GP11, GP2
	JNE LBB2_5
LBB2_6:                                 ; %if.then16
                                        ;   in Loop: Header=BB2_4 Depth=2
	LD GP11, GP8, #0
	SUB GP8, GP11
	LD GP15, GP8, #12
	LD GP16, GP8, #8
	ST GP15, GP16, #12
	ST GP16, GP15, #8
	ADD GP11, GP14
	JMP LBB2_7
LBB2_5:                                 ;   in Loop: Header=BB2_4 Depth=2
	MOV GP11, GP14
LBB2_7:                                 ; %if.end
                                        ;   in Loop: Header=BB2_4 Depth=2
	AND GP12, GP3
	CMP GP13, GP9
	JEQ LBB2_12
LBB2_8:                                 ; %if.then23
                                        ;   in Loop: Header=BB2_4 Depth=2
	MOV GP14, GP13
	ADD GP14, GP12
	LD GP14, GP14, #4
	ST GP12, GP13, #4
	ANDI GP14, #1
	CMP GP14, GP2
	JNE LBB2_9
LBB2_10:                                ; %if.then29
                                        ;   in Loop: Header=BB2_4 Depth=2
	LD GP14, GP13, #12
	LD GP13, GP13, #8
	ST GP14, GP13, #12
	ST GP13, GP14, #8
	ADD GP11, GP12
	JMP LBB2_11
LBB2_9:                                 ;   in Loop: Header=BB2_4 Depth=2
LBB2_11:                                ; %if.end35
                                        ;   in Loop: Header=BB2_4 Depth=2
	LD GP12, GP23, #60
	ST GP8, GP23, #60
	ST GP8, GP12, #12
	ST GP6, GP8, #12
	MOV GP13, GP11
	ORI GP13, #1
	ST GP13, GP8, #4
	ST GP12, GP8, #8
	ADD GP8, GP11
	ST GP11, GP8, #0
	JMP LBB2_13
LBB2_15:                                ; %if.else54
	CALLI malloc_init_state
LBB2_16:                                ; %if.end55
	RET
                                        ; -- End function
largebin_index:                         ; -- Begin function largebin_index
                                        ; @largebin_index
; %bb.0:                                ; %entry
	LUI GP2, #4095
	ORI GP2, #1048575
	CMP GP23, GP2
	JLEU LBB3_2
LBB3_1:
	LLI GP28, #95
	RET
LBB3_2:                                 ; %if.end
	MOV GP28, GP23
	SHRI GP28, #8
	MOV GP2, GP28
	ADDI GP2, #1048320
	SHRI GP2, #16
	ANDI GP2, #8
	SHL GP28, GP2
	MOV GP3, GP28
	ADDI GP3, #520192
	SHRI GP3, #16
	LUI GP4, #1048575
	ORI GP4, #1048575
	ANDI GP3, #4
	SHL GP28, GP3
	MOV GP5, GP28
	ADDI GP5, #245760
	SHRI GP5, #16
	ANDI GP5, #2
	SHL GP28, GP5
	MOV GP6, GP28
	SHRI GP6, #15
	XOR GP6, GP4
	OR GP3, GP2
	SHRI GP28, #14
	AND GP28, GP6
	OR GP3, GP5
	SUB GP28, GP3
	MOV GP2, GP28
	ADDI GP2, #19
	SHR GP23, GP2
	SHLI GP28, #2
	ANDI GP23, #3
	OR GP28, GP23
	ADDI GP28, #84
	RET
                                        ; -- End function
sYSMALLOc:                              ; -- Begin function sYSMALLOc
                                        ; @sYSMALLOc
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #68
	MOV GP3, GP23
	LUI GP4, #1048575
	LDB GP2, GP24, #0
	ANDI GP2, #2
	LLI GP7, #0
	CMP GP2, GP7
	ST GP3, GP0, #-16
	ST GP4, GP0, #-8
	JNE LBB4_1
LBB4_2:                                 ; %if.end
	MOV GP28, GP4
	ORI GP28, #1048575
	LD GP2, GP24, #860
	MOV GP5, GP2
	ADD GP5, GP28
	MOV GP8, GP3
	ST GP5, GP0, #-44
	ADD GP8, GP5
	LD GP3, GP24, #840
	ADD GP8, GP3
	MOV GP3, GP4
	ORI GP3, #1048572
	LD GP5, GP24, #44
	LD GP4, GP5, #4
	ST GP4, GP0, #-68
	MOV GP6, GP4
	ST GP3, GP0, #-52
	AND GP6, GP3
	ST GP24, GP0, #-32
	LDB GP3, GP24, #864
	ANDI GP3, #1
	MOV GP4, GP7
	SUB GP4, GP3
	AND GP4, GP6
	SUB GP8, GP4
	ST GP7, GP0, #-60
	MOV GP3, GP7
	SUB GP3, GP2
	ADDI GP8, #16
	ST GP3, GP0, #-64
	AND GP8, GP3
	ST GP5, GP0, #-56
	ST GP6, GP0, #-24
	ADD GP5, GP6
	ST GP5, GP0, #-28
	LLI GP2, #1
	ST GP2, GP0, #-48
	CMP GP8, GP2
	ST GP8, GP0, #-20
	JLT LBB4_4
LBB4_3:                                 ; %if.then12
	LD GP23, GP0, #-20
	CALLI sbrk
	LD GP8, GP0, #-20
LBB4_4:                                 ; %if.end14
	ST GP28, GP0, #-12
	LUI GP23, .mstr
	ORI GP23, .mstr
	CALLI sc32_prints
	LUI GP23, .mstr.1
	ORI GP23, .mstr.1
	CALLI sc32_prints
	LD GP23, GP0, #-12
	CALLI sc32_print_hex
	LUI GP23, .mstr.2
	ORI GP23, .mstr.2
	ST GP23, GP0, #-4
	CALLI sc32_prints
	LUI GP23, .mstr.3
	ORI GP23, .mstr.3
	CALLI sc32_prints
	LD GP2, GP0, #-12
	LD GP3, GP0, #-28
	CMP GP2, GP3
	JEQ LBB4_5
LBB4_6:                                 ; %if.end14
	LUI GP2, .mstr.6
	ORI GP2, .mstr.6
	JMP LBB4_7
LBB4_1:                                 ; %if.then
	MOV GP23, GP24
	CALLI malloc_consolidate
	LD GP2, GP0, #-8
	ORI GP2, #1048569
	LD GP23, GP0, #-16
	ADD GP23, GP2
	CALLI malloc
	JMP LBB4_38
LBB4_5:
	LUI GP2, .mstr.5
	ORI GP2, .mstr.5
LBB4_7:                                 ; %if.end14
	ST GP2, GP0, #-36
	MOV GP23, GP3
	CALLI sc32_print_hex
	LUI GP2, .mstr.4
	ORI GP2, .mstr.4
	ST GP2, GP0, #-40
	LD GP23, GP0, #-4
	CALLI sc32_prints
	LD GP23, GP0, #-40
	CALLI sc32_prints
	LD GP23, GP0, #-24
	CALLI sc32_print_hex
	LD GP23, GP0, #-4
	CALLI sc32_prints
	LD GP23, GP0, #-36
	CALLI sc32_prints
	LD GP6, GP0, #-8
	MOV GP8, GP6
	ORI GP8, #1048575
	LD GP7, GP0, #-12
	CMP GP7, GP8
	JEQ LBB4_37
LBB4_8:                                 ; %if.then19
	LD GP5, GP0, #-32
	LD GP2, GP5, #872
	LD GP9, GP0, #-20
	ADD GP2, GP9
	ST GP2, GP5, #872
	LD GP11, GP0, #-28
	CMP GP7, GP11
	JEQ LBB4_9
LBB4_10:                                ; %if.else26
	LD GP3, GP0, #-24
	LD GP10, GP0, #-60
	CMP GP3, GP10
	JNE LBB4_12
LBB4_11:                                ; %if.else26
	ST GP10, GP0, #-48
LBB4_12:                                ; %if.else26
	LD GP3, GP5, #864
	MOV GP4, GP3
	ANDI GP4, #1
	CMP GP4, GP10
	JEQ LBB4_16
LBB4_13:                                ; %if.else26
	LLI GP4, #0
	LD GP10, GP0, #-24
	CMP GP10, GP4
	JEQ LBB4_16
LBB4_14:                                ; %if.else26
	CMP GP7, GP11
	JGEU LBB4_16
LBB4_15:                                ; %if.then34
	MOV GP4, GP6
	ORI GP4, #1048574
	AND GP3, GP4
	ST GP3, GP5, #864
LBB4_16:                                ; %if.end37
	LDB GP3, GP5, #864
	ANDI GP3, #1
	LLI GP4, #0
	CMP GP3, GP4
	ST GP8, GP0, #-36
	JNE LBB4_17
LBB4_26:                                ; %if.then76
	ADD GP9, GP7
	ST GP9, GP0, #-20
	LLI GP23, #0
	ST GP23, GP0, #-44
	CALLI sbrk
	LD GP7, GP0, #-36
	LD GP4, GP0, #-8
	LD GP5, GP0, #-32
	MOV GP2, GP28
	LD GP3, GP0, #-20
	SUB GP2, GP3
	LD GP3, GP5, #872
	ADD GP2, GP3
	ST GP2, GP5, #872
	LD GP6, GP0, #-12
	JMP LBB4_27
LBB4_9:                                 ; %if.then23
	LD GP2, GP0, #-24
	ADD GP9, GP2
	ORI GP9, #1
	LD GP2, GP0, #-56
	ST GP9, GP2, #4
	JMP LBB4_31
LBB4_17:                                ; %if.then41
	LD GP3, GP0, #-48
	ANDI GP3, #1
	CMP GP3, GP4
	JEQ LBB4_19
LBB4_18:                                ; %if.then43
	MOV GP3, GP7
	SUB GP3, GP11
	ADD GP3, GP2
	ST GP3, GP5, #872
LBB4_19:                                ; %if.end46
	MOV GP2, GP7
	ADDI GP2, #8
	ANDI GP2, #7
	CMP GP2, GP4
	JEQ LBB4_21
LBB4_20:                                ; %if.end46
	LLI GP4, #8
	SUB GP4, GP2
LBB4_21:                                ; %if.end46
	ST GP4, GP0, #-28
	ADD GP7, GP9
	MOV GP2, GP4
	LD GP3, GP0, #-24
	ADD GP2, GP3
	ST GP7, GP0, #-20
	MOV GP3, GP7
	ADD GP3, GP2
	LD GP23, GP0, #-44
	ADD GP23, GP3
	LD GP4, GP0, #-64
	AND GP23, GP4
	SUB GP23, GP3
	ADD GP23, GP2
	ST GP23, GP0, #-44
	CALLI sbrk
	LD GP2, GP0, #-12
	MOV GP6, GP2
	LD GP3, GP0, #-28
	ADD GP6, GP3
	LD GP7, GP0, #-36
	CMP GP28, GP7
	JEQ LBB4_22
LBB4_23:                                ; %if.else66
	CMP GP28, GP2
	JGEU LBB4_24
LBB4_25:                                ; %if.then68
	LD GP4, GP0, #-8
	MOV GP2, GP4
	ORI GP2, #1048574
	LD GP5, GP0, #-32
	LD GP3, GP5, #864
	AND GP3, GP2
	ST GP3, GP5, #864
	LLI GP2, #0
	ST GP2, GP0, #-44
	LD GP28, GP0, #-20
	JMP LBB4_27
LBB4_22:                                ; %if.then64
	LLI GP23, #0
	ST GP23, GP0, #-44
	ST GP6, GP0, #-12
	CALLI sbrk
	LD GP6, GP0, #-12
	LD GP7, GP0, #-36
LBB4_24:
	LD GP5, GP0, #-32
	LD GP4, GP0, #-8
LBB4_27:                                ; %if.end85
	CMP GP28, GP7
	JEQ LBB4_31
LBB4_28:                                ; %if.then87
	ST GP6, GP5, #44
	SUB GP28, GP6
	LD GP3, GP0, #-44
	ADD GP28, GP3
	ORI GP28, #1
	ST GP28, GP6, #4
	LD GP2, GP5, #872
	ADD GP2, GP3
	ST GP2, GP5, #872
	LD GP3, GP0, #-48
	ANDI GP3, #1
	LLI GP2, #0
	CMP GP3, GP2
	JEQ LBB4_31
LBB4_29:                                ; %if.then99
	MOV GP2, GP4
	ORI GP2, #1048564
	LD GP6, GP0, #-68
	ADD GP6, GP2
	ORI GP4, #1048568
	MOV GP2, GP6
	AND GP2, GP4
	LD GP4, GP0, #-56
	MOV GP3, GP4
	ADD GP3, GP2
	ORI GP2, #1
	ST GP2, GP4, #4
	LLI GP2, #5
	ST GP2, GP3, #8
	ST GP2, GP3, #4
	LLI GP2, #16
	CMP GP6, GP2
	JLTU LBB4_31
LBB4_30:                                ; %if.then110
	LD GP2, GP5, #836
	ST GP2, GP0, #-8
	ST GP7, GP5, #836
	LD GP23, GP0, #-56
	ADDI GP23, #8
	CALLI free
	LD GP5, GP0, #-32
	LD GP2, GP0, #-8
	ST GP2, GP5, #836
LBB4_31:                                ; %if.end117
	LD GP2, GP5, #872
	LD GP3, GP5, #876
	CMP GP2, GP3
	JLEU LBB4_33
LBB4_32:                                ; %if.then120
	ST GP2, GP5, #876
LBB4_33:                                ; %if.end122
	LD GP3, GP5, #868
	ADD GP3, GP2
	LD GP2, GP5, #884
	CMP GP3, GP2
	JLEU LBB4_35
LBB4_34:                                ; %if.then125
	ST GP3, GP5, #884
LBB4_35:                                ; %if.end127
	LUI GP23, .mstr.7
	ORI GP23, .mstr.7
	LD GP2, GP5, #44
	ST GP2, GP0, #-12
	LD GP2, GP2, #4
	ST GP2, GP0, #-8
	CALLI sc32_prints
	LUI GP23, .mstr.8
	ORI GP23, .mstr.8
	CALLI sc32_prints
	LD GP23, GP0, #-12
	CALLI sc32_print_hex
	LD GP23, GP0, #-4
	CALLI sc32_prints
	LUI GP23, .mstr.9
	ORI GP23, .mstr.9
	CALLI sc32_prints
	LD GP2, GP0, #-52
	LD GP23, GP0, #-8
	AND GP23, GP2
	ST GP23, GP0, #-8
	LUI GP2, .mstr.10
	ORI GP2, .mstr.10
	ST GP2, GP0, #-20
	CALLI sc32_print_hex
	LD GP23, GP0, #-4
	CALLI sc32_prints
	LD GP23, GP0, #-20
	CALLI sc32_prints
	LD GP23, GP0, #-16
	CALLI sc32_print_hex
	LD GP23, GP0, #-4
	CALLI sc32_prints
	LD GP5, GP0, #-8
	LD GP3, GP0, #-16
	MOV GP2, GP3
	ADDI GP2, #16
	CMP GP5, GP2
	JGEU LBB4_36
LBB4_37:                                ; %if.end143
	CALLI __errno_location
	LLI GP2, #12
	ST GP2, GP28, #0
	LLI GP28, #0
	JMP LBB4_38
LBB4_36:                                ; %if.then133
	LD GP28, GP0, #-12
	MOV GP2, GP28
	ADD GP2, GP3
	LD GP4, GP0, #-32
	ST GP2, GP4, #44
	SUB GP5, GP3
	ORI GP3, #1
	ST GP3, GP28, #4
	ORI GP5, #1
	ST GP5, GP2, #4
	ADDI GP28, #8
LBB4_38:                                ; %cleanup
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
free:                                   ; -- Begin function free
                                        ; @free
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #8
	ST GP23, GP0, #-4
	CALLI get_malloc_state
	LD GP6, GP0, #-4
	LLI GP2, #0
	CMP GP6, GP2
	JEQ LBB5_18
LBB5_1:                                 ; %if.then
	LUI GP11, #1048575
	MOV GP4, GP11
	ORI GP4, #1048568
	MOV GP3, GP6
	ADD GP3, GP4
	ORI GP11, #1048572
	LD GP5, GP6, #-4
	MOV GP8, GP5
	AND GP8, GP11
	LD GP4, GP28, #0
	CMP GP8, GP4
	JLEU LBB5_2
LBB5_3:                                 ; %if.else
	MOV GP6, GP5
	ANDI GP6, #2
	CMP GP6, GP2
	JNE LBB5_18
LBB5_4:                                 ; %if.then7
	MOV GP6, GP4
	ORI GP6, #1
	ST GP6, GP28, #0
	MOV GP7, GP3
	ADD GP7, GP8
	LD GP6, GP7, #4
	ANDI GP5, #1
	CMP GP5, GP2
	JNE LBB5_5
LBB5_6:                                 ; %if.then16
	LD GP5, GP3, #0
	SUB GP3, GP5
	LD GP9, GP3, #12
	LD GP10, GP3, #8
	ST GP9, GP10, #12
	ST GP10, GP9, #8
	ADD GP5, GP8
	JMP LBB5_7
LBB5_2:                                 ; %if.then3
	ORI GP4, #3
	ST GP4, GP28, #0
	LUI GP2, #524287
	ORI GP2, #1048572
	SHRI GP5, #1
	AND GP5, GP2
	ADD GP28, GP5
	LD GP2, GP28, #-4
	ST GP2, GP6, #0
	ST GP3, GP28, #-4
LBB5_18:                                ; %if.end71
	MOV GP29, GP0
	POP GP0
	RET
LBB5_5:
	MOV GP5, GP8
LBB5_7:                                 ; %if.end
	AND GP6, GP11
	LD GP8, GP28, #44
	CMP GP7, GP8
	JEQ LBB5_12
LBB5_8:                                 ; %if.then23
	MOV GP8, GP7
	ADD GP8, GP6
	LD GP8, GP8, #4
	ST GP6, GP7, #4
	ANDI GP8, #1
	CMP GP8, GP2
	JNE LBB5_9
LBB5_10:                                ; %if.then29
	LD GP8, GP7, #12
	LD GP7, GP7, #8
	ST GP8, GP7, #12
	ST GP7, GP8, #8
	ADD GP5, GP6
	JMP LBB5_11
LBB5_12:                                ; %if.else47
	ADD GP5, GP6
	MOV GP6, GP5
	ORI GP6, #1
	ST GP6, GP3, #4
	ST GP3, GP28, #44
	JMP LBB5_13
LBB5_9:
LBB5_11:                                ; %if.end35
	LD GP6, GP28, #60
	MOV GP7, GP28
	ADDI GP7, #52
	ST GP7, GP3, #12
	ST GP6, GP3, #8
	ST GP3, GP28, #60
	ST GP3, GP6, #12
	MOV GP6, GP5
	ORI GP6, #1
	ST GP6, GP3, #4
	ADD GP3, GP5
	ST GP5, GP3, #0
LBB5_13:                                ; %if.end52
	LLI GP3, #131072
	CMP GP5, GP3
	JLTU LBB5_18
LBB5_14:                                ; %if.then54
	ANDI GP4, #2
	CMP GP4, GP2
	JEQ LBB5_16
LBB5_15:                                ; %if.then58
	MOV GP23, GP28
	ST GP28, GP0, #-4
	ST GP11, GP0, #-8
	CALLI malloc_consolidate
	LD GP11, GP0, #-8
	LD GP28, GP0, #-4
LBB5_16:                                ; %if.end59
	LD GP2, GP28, #44
	LD GP2, GP2, #4
	AND GP2, GP11
	LD GP3, GP28, #836
	CMP GP2, GP3
	JLTU LBB5_18
LBB5_17:                                ; %if.then64
	LD GP23, GP28, #840
	MOV GP24, GP28
	CALLI sYSTRIm
	JMP LBB5_18
                                        ; -- End function
sYSTRIm:                                ; -- Begin function sYSTRIm
                                        ; @sYSTRIm
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #28
	LD GP2, GP24, #44
	LD GP4, GP2, #4
	LUI GP5, #1048575
	MOV GP2, GP5
	ORI GP2, #1048572
	AND GP4, GP2
	LD GP2, GP24, #860
	MOV GP6, GP2
	SUB GP6, GP23
	ADD GP6, GP4
	MOV GP3, GP5
	ORI GP3, #1048559
	ADD GP6, GP3
	DIV GP6, GP2
	ORI GP5, #1048575
	ADD GP6, GP5
	MUL GP6, GP2
	LLI GP2, #1
	CMP GP6, GP2
	JLT LBB6_1
LBB6_2:                                 ; %if.then
	ST GP6, GP0, #-20
	ST GP2, GP0, #-24
	ST GP5, GP0, #-16
	LLI GP23, #0
	ST GP23, GP0, #-4
	ST GP24, GP0, #-8
	ST GP4, GP0, #-12
	CALLI sbrk
	LD GP5, GP0, #-4
	LD GP2, GP0, #-8
	LD GP2, GP2, #44
	LD GP3, GP0, #-12
	ADD GP2, GP3
	CMP GP28, GP2
	JNE LBB6_7
LBB6_3:                                 ; %if.then6
	ST GP28, GP0, #-28
	LLI GP23, #0
	ST GP23, GP0, #-4
	LD GP2, GP0, #-20
	SUB GP23, GP2
	CALLI sbrk
	LD GP23, GP0, #-4
	CALLI sbrk
	LD GP2, GP0, #-16
	CMP GP28, GP2
	JEQ LBB6_4
LBB6_5:                                 ; %if.then6
	LD GP6, GP0, #-28
	CMP GP6, GP28
	LD GP3, GP0, #-8
	LD GP4, GP0, #-12
	LD GP5, GP0, #-4
	JEQ LBB6_7
LBB6_6:                                 ; %if.then13
	SUB GP6, GP28
	LD GP2, GP3, #872
	SUB GP2, GP6
	ST GP2, GP3, #872
	SUB GP4, GP6
	ORI GP4, #1
	LD GP2, GP3, #44
	ST GP4, GP2, #4
	LD GP5, GP0, #-24
	JMP LBB6_7
LBB6_1:
	LLI GP5, #0
LBB6_7:                                 ; %cleanup
	MOV GP28, GP5
	MOV GP29, GP0
	POP GP0
	RET
LBB6_4:
	LD GP5, GP0, #-4
	JMP LBB6_7
                                        ; -- End function
realloc:                                ; -- Begin function realloc
                                        ; @realloc
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #32
	ST GP24, GP0, #-8
	ST GP23, GP0, #-4
	CALLI get_malloc_state
	LD GP6, GP0, #-4
	LLI GP5, #0
	CMP GP6, GP5
	JEQ LBB7_1
LBB7_2:                                 ; %if.end
	LUI GP3, #1048575
	MOV GP2, GP3
	ORI GP2, #1048544
	LD GP7, GP0, #-8
	CMP GP7, GP2
	JGEU LBB7_3
LBB7_4:                                 ; %if.end5
	MOV GP10, GP3
	ORI GP10, #1048568
	LLI GP2, #5
	CMP GP7, GP2
	JLTU LBB7_5
LBB7_6:                                 ; %if.end5
	ADDI GP7, #11
	AND GP7, GP10
	JMP LBB7_7
LBB7_1:                                 ; %if.then
	LD GP23, GP0, #-8
	CALLI malloc
	MOV GP6, GP28
	JMP LBB7_30
LBB7_5:
	LLI GP7, #16
LBB7_7:                                 ; %if.end5
	LD GP4, GP6, #-4
	MOV GP2, GP4
	ANDI GP2, #2
	CMP GP2, GP5
	JNE LBB7_3
LBB7_8:                                 ; %if.then13
	MOV GP8, GP6
	ADD GP8, GP10
	MOV GP11, GP3
	ORI GP11, #1048572
	MOV GP9, GP4
	AND GP9, GP11
	CMP GP9, GP7
	JGEU LBB7_9
LBB7_10:                                ; %if.else
	MOV GP12, GP8
	ADD GP12, GP9
	LD GP2, GP12, #4
	LD GP5, GP28, #44
	CMP GP12, GP5
	JEQ LBB7_11
LBB7_14:                                ; %land.lhs.true36
	MOV GP4, GP3
	ORI GP4, #1048574
	MOV GP5, GP2
	AND GP5, GP4
	MOV GP4, GP12
	ADD GP4, GP5
	LDB GP4, GP4, #4
	ANDI GP4, #1
	LLI GP5, #0
	CMP GP4, GP5
	JNE LBB7_19
LBB7_15:                                ; %land.lhs.true43
	AND GP2, GP11
	ADD GP2, GP9
	CMP GP2, GP7
	JLTU LBB7_19
LBB7_16:                                ; %if.then48
	LD GP3, GP12, #12
	LD GP4, GP12, #8
	ST GP3, GP4, #12
	ST GP4, GP3, #8
	JMP LBB7_17
LBB7_3:                                 ; %if.else126
	ST GP5, GP0, #-12
	CALLI __errno_location
	LD GP6, GP0, #-12
	LLI GP2, #12
	ST GP2, GP28, #0
LBB7_30:                                ; %cleanup
	MOV GP28, GP6
	MOV GP29, GP0
	POP GP0
	RET
LBB7_9:
	MOV GP2, GP9
LBB7_17:                                ; %if.end101
	MOV GP3, GP2
	SUB GP3, GP7
	LLI GP4, #15
	CMP GP3, GP4
	JGTU LBB7_29
LBB7_18:                                ; %if.then104
	LD GP3, GP6, #-4
	ANDI GP3, #1
	OR GP3, GP2
	ST GP3, GP6, #-4
	ADD GP8, GP2
	LD GP2, GP8, #4
	JMP LBB7_13
LBB7_29:                                ; %if.else112
	LD GP4, GP6, #-4
	ANDI GP4, #1
	OR GP4, GP7
	ST GP4, GP6, #-4
	MOV GP23, GP8
	ADD GP23, GP7
	ORI GP3, #1
	ST GP3, GP23, #4
	ADD GP8, GP2
	LD GP2, GP8, #4
	ORI GP2, #1
	ST GP2, GP8, #4
	ADDI GP23, #8
	CALLI free
	LD GP6, GP0, #-4
	JMP LBB7_30
LBB7_11:                                ; %land.lhs.true
	AND GP2, GP11
	ADD GP2, GP9
	MOV GP5, GP7
	ADDI GP5, #16
	CMP GP2, GP5
	JGEU LBB7_12
LBB7_19:                                ; %if.else51
	ST GP12, GP0, #-28
	ST GP11, GP0, #-24
	ST GP10, GP0, #-20
	ST GP9, GP0, #-16
	ST GP8, GP0, #-32
	ORI GP3, #1048569
	ST GP7, GP0, #-8
	MOV GP23, GP7
	ADD GP23, GP3
	CALLI malloc
	LLI GP6, #0
	CMP GP28, GP6
	JEQ LBB7_30
LBB7_20:                                ; %if.end56
	MOV GP3, GP28
	LD GP2, GP0, #-20
	ADD GP28, GP2
	LD GP2, GP0, #-28
	CMP GP28, GP2
	JEQ LBB7_21
LBB7_22:                                ; %if.else63
	LD GP25, GP0, #-16
	LD GP2, GP0, #-24
	ADD GP25, GP2
	LLI GP2, #37
	CMP GP25, GP2
	ST GP3, GP0, #-12
	JLTU LBB7_24
LBB7_23:                                ; %if.then66
	MOV GP23, GP3
	LD GP24, GP0, #-4
	CALLI memcpy
	LD GP23, GP0, #-4
	JMP LBB7_28
LBB7_12:                                ; %if.then23
	ANDI GP4, #1
	OR GP4, GP7
	ST GP4, GP6, #-4
	ADD GP8, GP7
	ST GP8, GP28, #44
	SUB GP2, GP7
LBB7_13:                                ; %cleanup
	ORI GP2, #1
	ST GP2, GP8, #4
	JMP LBB7_30
LBB7_21:                                ; %if.then61
	LD GP2, GP3, #-4
	LD GP3, GP0, #-24
	AND GP2, GP3
	LD GP3, GP0, #-16
	ADD GP2, GP3
	LD GP6, GP0, #-4
	LD GP7, GP0, #-8
	LD GP8, GP0, #-32
	JMP LBB7_17
LBB7_24:                                ; %if.else68
	LD GP23, GP0, #-4
	LD GP2, GP23, #0
	ST GP2, GP3, #0
	LD GP2, GP23, #4
	ST GP2, GP3, #4
	LD GP2, GP23, #8
	ST GP2, GP3, #8
	LLI GP2, #17
	CMP GP25, GP2
	JLTU LBB7_28
LBB7_25:                                ; %if.then76
	LD GP2, GP23, #12
	LD GP3, GP0, #-12
	ST GP2, GP3, #12
	LD GP2, GP23, #16
	ST GP2, GP3, #16
	LLI GP2, #25
	CMP GP25, GP2
	JLTU LBB7_28
LBB7_26:                                ; %if.then82
	LD GP2, GP23, #20
	LD GP3, GP0, #-12
	ST GP2, GP3, #20
	LD GP2, GP23, #24
	ST GP2, GP3, #24
	LLI GP2, #33
	CMP GP25, GP2
	JLTU LBB7_28
LBB7_27:                                ; %if.then88
	LD GP2, GP23, #28
	LD GP3, GP0, #-12
	ST GP2, GP3, #28
	LD GP2, GP23, #32
	ST GP2, GP3, #32
LBB7_28:                                ; %if.end96
	CALLI free
	LD GP6, GP0, #-12
	JMP LBB7_30
                                        ; -- End function
memalign:                               ; -- Begin function memalign
                                        ; @memalign
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #24
	LLI GP2, #8
	CMP GP23, GP2
	JGTU LBB8_2
LBB8_1:                                 ; %if.then
	MOV GP23, GP24
	CALLI malloc
	MOV GP8, GP28
	JMP LBB8_25
LBB8_2:                                 ; %if.end
	LLI GP2, #16
	CMP GP23, GP2
	JGTU LBB8_4
LBB8_3:                                 ; %if.end
	MOV GP23, GP2
LBB8_4:                                 ; %if.end
	LUI GP5, #1048575
	MOV GP6, GP5
	ORI GP6, #1048575
	MOV GP2, GP23
	ADD GP2, GP6
	MOV GP3, GP23
	AND GP3, GP2
	LLI GP4, #0
	CMP GP3, GP4
	JEQ LBB8_5
LBB8_6:                                 ; %while.cond.preheader
	LLI GP2, #16
LBB8_7:                                 ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	MOV GP3, GP2
	SHLI GP2, #1
	CMP GP3, GP23
	JLTU LBB8_7
	JMP LBB8_8
LBB8_5:
	MOV GP3, GP23
LBB8_8:                                 ; %if.end7
	MOV GP2, GP5
	ORI GP2, #1048544
	CMP GP24, GP2
	ST GP4, GP0, #-4
	JLTU LBB8_10
LBB8_9:                                 ; %if.then9
	CALLI __errno_location
	LD GP8, GP0, #-4
	LLI GP2, #12
	ST GP2, GP28, #0
	JMP LBB8_25
LBB8_10:                                ; %if.end11
	MOV GP7, GP5
	ORI GP7, #1048568
	LLI GP2, #5
	CMP GP24, GP2
	ST GP5, GP0, #-16
	ST GP6, GP0, #-24
	ST GP7, GP0, #-8
	JLTU LBB8_11
LBB8_12:                                ; %if.end11
	ADDI GP24, #11
	AND GP24, GP7
	JMP LBB8_13
LBB8_11:
	LLI GP24, #16
LBB8_13:                                ; %if.end11
	ST GP24, GP0, #-20
	MOV GP23, GP24
	ADD GP23, GP3
	ADDI GP23, #16
	ST GP3, GP0, #-12
	CALLI malloc
	LD GP8, GP0, #-4
	CMP GP28, GP8
	JEQ LBB8_25
LBB8_14:                                ; %if.end22
	MOV GP2, GP28
	LD GP5, GP0, #-8
	ADD GP2, GP5
	MOV GP3, GP28
	LD GP6, GP0, #-12
	DIV GP3, GP6
	LLI GP3, #0
	AMOV GP4
	CMP GP4, GP3
	JEQ LBB8_15
LBB8_16:                                ; %if.then24
	MOV GP8, GP28
	ADD GP8, GP6
	LD GP4, GP0, #-24
	ADD GP8, GP4
	MOV GP4, GP3
	SUB GP4, GP6
	AND GP8, GP4
	ADD GP8, GP5
	MOV GP4, GP8
	SUB GP4, GP2
	LLI GP5, #16
	CMP GP4, GP5
	JLTU LBB8_18
LBB8_17:                                ; %if.then24
	MOV GP6, GP3
LBB8_18:                                ; %if.then24
	ADD GP8, GP6
	MOV GP4, GP8
	SUB GP4, GP2
	LD GP6, GP0, #-16
	ORI GP6, #1048572
	LD GP7, GP28, #-4
	MOV GP5, GP7
	AND GP5, GP6
	SUB GP5, GP4
	ANDI GP7, #2
	CMP GP7, GP3
	JNE LBB8_19
LBB8_20:                                ; %if.end47
	MOV GP2, GP8
	ADD GP2, GP5
	ORI GP5, #1
	ST GP5, GP8, #4
	LD GP3, GP2, #4
	ORI GP3, #1
	ST GP3, GP2, #4
	LD GP2, GP28, #-4
	ANDI GP2, #1
	OR GP2, GP4
	ST GP2, GP28, #-4
	MOV GP23, GP28
	ST GP8, GP0, #-4
	CALLI free
	LD GP8, GP0, #-4
	JMP LBB8_21
LBB8_15:
	MOV GP8, GP2
LBB8_21:                                ; %if.end58
	LD GP5, GP0, #-20
	LD GP2, GP8, #4
	MOV GP3, GP2
	ANDI GP3, #2
	LLI GP4, #0
	CMP GP3, GP4
	JNE LBB8_24
LBB8_22:                                ; %if.then62
	LD GP4, GP0, #-16
	ORI GP4, #1048572
	MOV GP3, GP2
	AND GP3, GP4
	MOV GP4, GP5
	ADDI GP4, #16
	CMP GP3, GP4
	JLEU LBB8_24
LBB8_23:                                ; %if.then67
	SUB GP2, GP5
	ORI GP2, #1
	MOV GP23, GP8
	ADD GP23, GP5
	ST GP2, GP23, #4
	LD GP2, GP8, #4
	ANDI GP2, #1
	OR GP2, GP5
	ST GP2, GP8, #4
	ADDI GP23, #8
	ST GP8, GP0, #-4
	CALLI free
	LD GP8, GP0, #-4
	JMP LBB8_24
LBB8_19:                                ; %if.then42
	LD GP2, GP2, #0
	ORI GP5, #2
	ST GP5, GP8, #4
	ADD GP2, GP4
	ST GP2, GP8, #0
LBB8_24:                                ; %if.end78
	ADDI GP8, #8
LBB8_25:                                ; %cleanup
	MOV GP28, GP8
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
calloc:                                 ; -- Begin function calloc
                                        ; @calloc
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #4
	MUL GP24, GP23
	MOV GP23, GP24
	CALLI malloc
	LLI GP2, #0
	CMP GP28, GP2
	JEQ LBB9_10
LBB9_1:                                 ; %if.then
	LUI GP3, #1048575
	MOV GP4, GP3
	ORI GP4, #1048572
	LD GP5, GP28, #-4
	MOV GP25, GP5
	AND GP25, GP4
	ANDI GP5, #2
	CMP GP5, GP2
	JNE LBB9_8
LBB9_2:                                 ; %if.then1
	ADD GP25, GP4
	LLI GP3, #37
	CMP GP25, GP3
	JLTU LBB9_4
LBB9_3:                                 ; %if.then5
	JMP LBB9_9
LBB9_8:                                 ; %if.else25
	ORI GP3, #1048568
	ADD GP25, GP3
LBB9_9:                                 ; %if.end31
	LLI GP24, #0
	MOV GP23, GP28
	ST GP28, GP0, #-4
	CALLI memset
	LD GP28, GP0, #-4
LBB9_10:                                ; %if.end31
	MOV GP29, GP0
	POP GP0
	RET
LBB9_4:                                 ; %if.else
	ST GP2, GP28, #8
	ST GP2, GP28, #4
	ST GP2, GP28, #0
	LLI GP3, #17
	CMP GP25, GP3
	JLTU LBB9_10
LBB9_5:                                 ; %if.then11
	ST GP2, GP28, #16
	ST GP2, GP28, #12
	LLI GP3, #25
	CMP GP25, GP3
	JLTU LBB9_10
LBB9_6:                                 ; %if.then15
	ST GP2, GP28, #24
	ST GP2, GP28, #20
	LLI GP3, #33
	CMP GP25, GP3
	JLTU LBB9_10
LBB9_7:                                 ; %if.then19
	ST GP2, GP28, #32
	ST GP2, GP28, #28
	JMP LBB9_10
                                        ; -- End function
cfree:                                  ; -- Begin function cfree
                                        ; @cfree
; %bb.0:                                ; %entry
	CALLI free
	RET
                                        ; -- End function
independent_calloc:                     ; -- Begin function independent_calloc
                                        ; @independent_calloc
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #4
	MOV GP26, GP25
	ST GP24, GP0, #-4
	MOV GP24, GP0
	SUBI GP24, #4
	LLI GP25, #3
	CALLI iALLOc
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
iALLOc:                                 ; -- Begin function iALLOc
                                        ; @iALLOc
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #44
	ST GP26, GP0, #-4
	ST GP25, GP0, #-16
	ST GP24, GP0, #-12
	ST GP23, GP0, #-8
	CALLI get_malloc_state
	LD GP2, GP28, #0
	LLI GP4, #0
	CMP GP2, GP4
	ST GP28, GP0, #-20
	JNE LBB12_2
LBB12_1:                                ; %if.then
	MOV GP23, GP28
	ST GP4, GP0, #-24
	CALLI malloc_consolidate
	LD GP4, GP0, #-24
	LD GP28, GP0, #-20
LBB12_2:                                ; %if.end
	LD GP3, GP0, #-4
	CMP GP3, GP4
	JEQ LBB12_4
LBB12_3:                                ; %if.then2
	LD GP9, GP0, #-8
	CMP GP9, GP4
	MOV GP12, GP4
	MOV GP13, GP3
	JNE LBB12_9
	JMP LBB12_33
LBB12_4:                                ; %if.else
	LLI GP3, #0
	LD GP9, GP0, #-8
	CMP GP9, GP3
	JEQ LBB12_5
LBB12_6:                                ; %if.end9
	MOV GP12, GP9
	SHLI GP12, #2
	ADDI GP12, #11
	LLI GP2, #16
	CMP GP12, GP2
	JGTU LBB12_8
LBB12_7:                                ; %if.end9
	MOV GP12, GP2
LBB12_8:                                ; %if.end9
	LUI GP2, #1048575
	ORI GP2, #1048568
	AND GP12, GP2
LBB12_9:                                ; %if.end15
	ST GP3, GP0, #-4
	LD GP2, GP0, #-16
	ANDI GP2, #1
	CMP GP2, GP4
	LUI GP11, #1048575
	LD GP8, GP0, #-12
	JNE LBB12_15
LBB12_10:                               ; %for.cond.preheader
	LLI GP6, #0
	CMP GP9, GP6
	MOV GP10, GP6
	JEQ LBB12_18
LBB12_11:                               ; %for.body.preheader
	LLI GP10, #0
	LLI GP2, #16
	MOV GP3, GP11
	ORI GP3, #1048568
	MOV GP4, GP10
	MOV GP5, GP10
	JMP LBB12_12
LBB12_14:                               ; %for.body
                                        ;   in Loop: Header=BB12_12 Depth=1
	AND GP6, GP3
	ADD GP6, GP5
	ADDI GP4, #1
	CMP GP4, GP9
	MOV GP5, GP6
	JEQ LBB12_18
LBB12_12:                               ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	MOV GP6, GP4
	SHLI GP6, #2
	MOV GP7, GP8
	ADD GP7, GP6
	LD GP6, GP7, #0
	ADDI GP6, #11
	CMP GP6, GP2
	JGTU LBB12_14
LBB12_13:                               ; %for.body
                                        ;   in Loop: Header=BB12_12 Depth=1
	MOV GP6, GP2
	JMP LBB12_14
LBB12_15:                               ; %if.then17
	LD GP10, GP8, #0
	ADDI GP10, #11
	LLI GP2, #16
	CMP GP10, GP2
	JGTU LBB12_17
LBB12_16:                               ; %if.then17
	MOV GP10, GP2
LBB12_17:                               ; %if.then17
	MOV GP2, GP11
	ORI GP2, #1048568
	AND GP10, GP2
	MOV GP6, GP10
	MUL GP6, GP9
LBB12_18:                               ; %if.end43
	ST GP10, GP0, #-40
	ST GP12, GP0, #-24
	LD GP23, GP0, #-24
	ST GP6, GP0, #-44
	ADD GP23, GP6
	MOV GP2, GP11
	ORI GP2, #1048569
	ADD GP23, GP2
	LD GP2, GP28, #852
	ST GP2, GP0, #-28
	LLI GP2, #0
	ST GP2, GP0, #-32
	ST GP2, GP28, #852
	ST GP11, GP0, #-36
	CALLI malloc
	LD GP13, GP0, #-32
	LD GP6, GP0, #-24
	LD GP9, GP0, #-8
	LD GP2, GP0, #-28
	LD GP3, GP0, #-20
	ST GP2, GP3, #852
	CMP GP28, GP13
	LD GP4, GP0, #-4
	JEQ LBB12_33
LBB12_19:                               ; %if.end50
	MOV GP7, GP28
	LD GP8, GP0, #-36
	MOV GP2, GP8
	ORI GP2, #1048572
	LD GP10, GP7, #-4
	AND GP10, GP2
	MOV GP12, GP8
	ORI GP12, #1048568
	LLI GP3, #2
	LD GP5, GP0, #-16
	CMP GP5, GP3
	MOV GP3, GP8
	JLTU LBB12_21
LBB12_20:                               ; %if.then55
	ST GP10, GP0, #-20
	LD GP25, GP0, #-20
	SUB GP25, GP6
	ADD GP25, GP2
	LLI GP24, #0
	ST GP7, GP0, #-16
	LD GP23, GP0, #-16
	ST GP28, GP0, #-24
	ST GP12, GP0, #-28
	CALLI memset
	LD GP10, GP0, #-20
	LD GP7, GP0, #-16
	LD GP12, GP0, #-28
	LD GP28, GP0, #-24
	LD GP3, GP0, #-36
	LD GP4, GP0, #-4
	LD GP9, GP0, #-8
LBB12_21:                               ; %if.end59
	ADD GP28, GP12
	LLI GP2, #0
	CMP GP4, GP2
	LD GP8, GP0, #-12
	JEQ LBB12_23
LBB12_22:
	MOV GP11, GP10
	MOV GP13, GP4
	JMP LBB12_24
LBB12_23:                               ; %if.then61
	MOV GP13, GP28
	LD GP11, GP0, #-44
	ADD GP13, GP11
	SUB GP10, GP11
	ORI GP10, #1
	ST GP10, GP13, #4
	ADDI GP13, #8
LBB12_24:                               ; %if.end66
	LD GP10, GP0, #-40
	ST GP7, GP13, #0
	ORI GP3, #1048575
	ADD GP9, GP3
	CMP GP9, GP2
	JEQ LBB12_25
LBB12_26:                               ; %if.then72.lr.ph
	LLI GP3, #16
	MOV GP4, GP2
	JMP LBB12_27
LBB12_30:                               ; %if.else75
                                        ;   in Loop: Header=BB12_27 Depth=1
	AND GP5, GP12
LBB12_31:                               ; %if.end88
                                        ;   in Loop: Header=BB12_27 Depth=1
	MOV GP6, GP5
	ORI GP6, #1
	ST GP6, GP28, #4
	ADDI GP4, #1
	MOV GP6, GP4
	SHLI GP6, #2
	MOV GP7, GP13
	ADD GP7, GP6
	ADD GP28, GP5
	MOV GP6, GP28
	ADDI GP6, #8
	ST GP6, GP7, #0
	SUB GP11, GP5
	CMP GP4, GP9
	JEQ LBB12_32
LBB12_27:                               ; %if.then72
                                        ; =>This Inner Loop Header: Depth=1
	CMP GP10, GP2
	MOV GP5, GP10
	JNE LBB12_31
LBB12_28:                               ; %if.else75
                                        ;   in Loop: Header=BB12_27 Depth=1
	MOV GP5, GP4
	SHLI GP5, #2
	MOV GP6, GP8
	ADD GP6, GP5
	LD GP5, GP6, #0
	ADDI GP5, #11
	CMP GP5, GP3
	JGTU LBB12_30
LBB12_29:                               ; %if.else75
                                        ;   in Loop: Header=BB12_27 Depth=1
	MOV GP5, GP3
	JMP LBB12_30
LBB12_25:
LBB12_32:                               ; %if.else93
	ORI GP11, #1
	ST GP11, GP28, #4
	JMP LBB12_33
LBB12_5:                                ; %if.then7
	LLI GP23, #0
	CALLI malloc
	MOV GP13, GP28
LBB12_33:                               ; %cleanup
	MOV GP28, GP13
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
independent_comalloc:                   ; -- Begin function independent_comalloc
                                        ; @independent_comalloc
; %bb.0:                                ; %entry
	MOV GP26, GP25
	LLI GP25, #0
	CALLI iALLOc
	RET
                                        ; -- End function
valloc:                                 ; -- Begin function valloc
                                        ; @valloc
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #8
	ST GP23, GP0, #-4
	CALLI get_malloc_state
	LD GP2, GP28, #0
	LLI GP3, #0
	CMP GP2, GP3
	JNE LBB14_2
LBB14_1:                                ; %if.then
	MOV GP23, GP28
	ST GP28, GP0, #-8
	CALLI malloc_consolidate
	LD GP28, GP0, #-8
LBB14_2:                                ; %if.end
	LD GP23, GP28, #860
	LD GP24, GP0, #-4
	CALLI memalign
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
pvalloc:                                ; -- Begin function pvalloc
                                        ; @pvalloc
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #12
	ST GP23, GP0, #-4
	CALLI get_malloc_state
	LD GP2, GP28, #0
	LLI GP3, #0
	CMP GP2, GP3
	JNE LBB15_2
LBB15_1:                                ; %if.then
	MOV GP23, GP28
	ST GP3, GP0, #-8
	ST GP28, GP0, #-12
	CALLI malloc_consolidate
	LD GP28, GP0, #-12
	LD GP3, GP0, #-8
LBB15_2:                                ; %if.end
	LD GP23, GP28, #860
	LD GP24, GP0, #-4
	ADD GP24, GP23
	LUI GP2, #1048575
	ORI GP2, #1048575
	ADD GP24, GP2
	SUB GP3, GP23
	AND GP24, GP3
	CALLI memalign
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
malloc_trim:                            ; -- Begin function malloc_trim
                                        ; @malloc_trim
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #8
	ST GP23, GP0, #-4
	CALLI get_malloc_state
	MOV GP23, GP28
	ST GP23, GP0, #-8
	CALLI malloc_consolidate
	LD GP23, GP0, #-4
	LD GP24, GP0, #-8
	CALLI sYSTRIm
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
malloc_usable_size:                     ; -- Begin function malloc_usable_size
                                        ; @malloc_usable_size
; %bb.0:                                ; %entry
	LLI GP28, #0
	CMP GP23, GP28
	JEQ LBB17_4
LBB17_1:                                ; %if.then
	LUI GP2, #1048575
	MOV GP4, GP2
	ORI GP4, #1048572
	LD GP5, GP23, #-4
	MOV GP28, GP5
	AND GP28, GP4
	ANDI GP5, #2
	LLI GP3, #0
	CMP GP5, GP3
	JNE LBB17_2
LBB17_3:                                ; %if.else
	ADD GP23, GP28
	ADD GP28, GP4
	LDB GP2, GP23, #-4
	ANDI GP2, #1
	SUB GP3, GP2
	AND GP3, GP28
	MOV GP28, GP3
LBB17_4:                                ; %cleanup
	RET
LBB17_2:                                ; %if.then1
	ORI GP2, #1048568
	ADD GP28, GP2
	RET
                                        ; -- End function
mallinfo:                               ; -- Begin function mallinfo
                                        ; @mallinfo
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #12
	ST GP23, GP0, #-4
	CALLI get_malloc_state
	LD GP2, GP28, #44
	LLI GP11, #0
	CMP GP2, GP11
	JNE LBB18_2
LBB18_1:                                ; %if.then
	MOV GP23, GP28
	ST GP28, GP0, #-8
	ST GP11, GP0, #-12
	CALLI malloc_consolidate
	LD GP11, GP0, #-12
	LD GP28, GP0, #-8
LBB18_2:                                ; %if.end
	MOV GP6, GP28
	ADDI GP6, #4
	LD GP2, GP28, #44
	LD GP2, GP2, #4
	LLI GP7, #10
	LUI GP4, #1048575
	ORI GP4, #1048572
	MOV GP5, GP11
	MOV GP3, GP11
	MOV GP8, GP11
	JMP LBB18_3
LBB18_4:                                ;   in Loop: Header=BB18_3 Depth=1
LBB18_6:                                ; %for.inc8
                                        ;   in Loop: Header=BB18_3 Depth=1
	ADDI GP8, #1
	CMP GP8, GP7
	JEQ LBB18_7
LBB18_3:                                ; %for.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB18_5 Depth 2
	MOV GP9, GP8
	SHLI GP9, #2
	MOV GP10, GP6
	ADD GP10, GP9
	LD GP9, GP10, #0
	CMP GP9, GP11
	JEQ LBB18_4
LBB18_5:                                ; %for.body5
                                        ;   Parent Loop BB18_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	MOV GP10, GP3
	LD GP3, GP9, #4
	AND GP3, GP4
	ADD GP3, GP10
	ADDI GP5, #1
	LD GP9, GP9, #8
	CMP GP9, GP11
	JNE LBB18_5
	JMP LBB18_6
LBB18_7:                                ; %for.end10
	AND GP2, GP4
	LLI GP9, #1
	MOV GP6, GP3
	ADD GP6, GP2
	LLI GP8, #95
	MOV GP7, GP9
	JMP LBB18_8
LBB18_9:                                ;   in Loop: Header=BB18_8 Depth=1
LBB18_11:                               ; %for.inc26
                                        ;   in Loop: Header=BB18_8 Depth=1
	MOV GP10, GP9
	ADDI GP10, #1
	CMP GP9, GP8
	MOV GP9, GP10
	JGEU LBB18_12
LBB18_8:                                ; %for.body14
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB18_10 Depth 2
	MOV GP11, GP9
	SHLI GP11, #3
	MOV GP10, GP28
	ADD GP10, GP11
	LD GP11, GP10, #56
	ADDI GP10, #44
	CMP GP11, GP10
	JEQ LBB18_9
LBB18_10:                               ; %for.body18
                                        ;   Parent Loop BB18_8 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	MOV GP12, GP6
	LD GP6, GP11, #4
	AND GP6, GP4
	ADD GP6, GP12
	ADDI GP7, #1
	LD GP11, GP11, #12
	CMP GP11, GP10
	JNE LBB18_10
	JMP LBB18_11
LBB18_12:                               ; %for.end28
	LD GP8, GP0, #-4
	ST GP7, GP8, #4
	ST GP5, GP8, #8
	ST GP6, GP8, #32
	LD GP4, GP28, #872
	ST GP4, GP8, #0
	SUB GP4, GP6
	ST GP4, GP8, #28
	LD GP4, GP28, #848
	ST GP4, GP8, #12
	LD GP4, GP28, #868
	ST GP2, GP8, #36
	ST GP3, GP8, #24
	ST GP4, GP8, #16
	LD GP2, GP28, #884
	ST GP2, GP8, #20
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
malloc_stats:                           ; -- Begin function malloc_stats
                                        ; @malloc_stats
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #40
	MOV GP23, GP0
	SUBI GP23, #40
	CALLI mallinfo
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
mallopt:                                ; -- Begin function mallopt
                                        ; @mallopt
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #16
	ST GP24, GP0, #-8
	ST GP23, GP0, #-4
	CALLI get_malloc_state
	MOV GP23, GP28
	LLI GP2, #0
	ST GP2, GP0, #-16
	ST GP23, GP0, #-12
	CALLI malloc_consolidate
	LD GP4, GP0, #-4
	ADDI GP4, #4
	LLI GP2, #5
	CMP GP4, GP2
	JGTU LBB20_1
LBB20_2:                                ; %entry
	SHLI GP4, #2
	LUI GP3, JTI20_0
	ORI GP3, JTI20_0
	ADD GP3, GP4
	LD GP3, GP3, #0
	BR GP3, #0
	JMP LBB20_1
LBB20_13:                               ; %sw.bb16
	LLI GP28, #0
	LD GP2, GP0, #-8
	CMP GP2, GP28
	JNE LBB20_16
LBB20_14:                               ; %if.end
	LLI GP2, #0
	LD GP3, GP0, #-12
	ST GP2, GP3, #852
	JMP LBB20_15
LBB20_1:
	LD GP28, GP0, #-16
	JMP LBB20_16
LBB20_11:                               ; %sw.bb14
	LD GP2, GP0, #-12
	LD GP3, GP0, #-8
	ST GP3, GP2, #840
	JMP LBB20_15
LBB20_12:                               ; %sw.bb15
	LD GP2, GP0, #-12
	LD GP3, GP0, #-8
	ST GP3, GP2, #844
	JMP LBB20_15
LBB20_10:                               ; %sw.bb13
	LD GP2, GP0, #-12
	LD GP3, GP0, #-8
	ST GP3, GP2, #836
	JMP LBB20_15
LBB20_3:                                ; %sw.bb
	LLI GP3, #80
	LD GP4, GP0, #-8
	CMP GP4, GP3
	LD GP28, GP0, #-16
	JGTU LBB20_16
LBB20_4:                                ; %if.then
	CMP GP4, GP2
	JLTU LBB20_5
LBB20_6:                                ; %if.then
	MOV GP2, GP4
	ADDI GP2, #11
	ANDI GP2, #248
	JMP LBB20_7
LBB20_5:
	LLI GP2, #16
LBB20_7:                                ; %if.then
	LLI GP3, #0
	CMP GP4, GP3
	JNE LBB20_9
LBB20_8:
	LLI GP2, #8
LBB20_9:                                ; %if.then
	LD GP4, GP0, #-12
	LD GP3, GP4, #0
	ANDI GP3, #3
	OR GP3, GP2
	ST GP3, GP4, #0
LBB20_15:                               ; %cleanup
	LLI GP28, #1
LBB20_16:                               ; %cleanup
	MOV GP29, GP0
	POP GP0
	RET
	SECTION .rodata
  ALIGN 4 
JTI20_0:
	DD	LBB20_13
	DD	LBB20_12
	DD	LBB20_11
	DD	LBB20_10
	DD	LBB20_16
	DD	LBB20_3
                                        ; -- End function
	SECTION .text
malloc_init_state:                      ; -- Begin function malloc_init_state
                                        ; @malloc_init_state
; %bb.0:                                ; %entry
	PUSH GP0
	MOV GP0, GP29
	SUBI GP29, #4
	ST GP23, GP0, #-4
	LUI GP23, .mstr.11
	ORI GP23, .mstr.11
	CALLI sc32_prints
	LD GP7, GP0, #-4
	LLI GP3, #1
	LLI GP2, #95
	MOV GP4, GP3
LBB21_1:                                ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	MOV GP5, GP3
	SHLI GP5, #3
	MOV GP6, GP7
	ADD GP6, GP5
	MOV GP5, GP6
	ADDI GP5, #44
	ST GP5, GP6, #52
	ST GP5, GP6, #56
	ADDI GP4, #1
	CMP GP3, GP2
	MOV GP3, GP4
	JLTU LBB21_1
LBB21_2:                                ; %for.end
	LLI GP2, #0
	ST GP2, GP7, #852
	ST GP2, GP7, #840
	LLI GP2, #262144
	ST GP2, GP7, #844
	ST GP2, GP7, #836
	LLI GP2, #4096
	ST GP2, GP7, #860
	MOV GP2, GP7
	ADDI GP2, #52
	ST GP2, GP7, #44
	LD GP2, GP7, #864
	ORI GP2, #1
	ST GP2, GP7, #864
	LD GP2, GP7, #0
	ANDI GP2, #3
	ORI GP2, #72
	ST GP2, GP7, #0
	MOV GP29, GP0
	POP GP0
	RET
                                        ; -- End function
	SECTION .data
  ALIGN 4
av_:
	DD	8388608

	SECTION .rodata.mstr1.1
.mstr:                                   ; @.mstr
	DB 10
	DB 91
	DB 115
	DB 89
	DB 83
	DB 77
	DB 65
	DB 76
	DB 76
	DB 79
	DB 99
	DB 32
	DB 69
	DB 110
	DB 116
	DB 114
	DB 121
	DB 93
	DB 10
	DB 0

.mstr.1:                                 ; @.mstr.1
	DB 32
	DB 32
	DB 98
	DB 114
	DB 107
	DB 32
	DB 40
	DB 115
	DB 98
	DB 114
	DB 107
	DB 32
	DB 49
	DB 41
	DB 58
	DB 32
	DB 32
	DB 32
	DB 0

.mstr.2:                                 ; @.mstr.2
	DB 10
	DB 0

.mstr.3:                                 ; @.mstr.3
	DB 32
	DB 32
	DB 111
	DB 108
	DB 100
	DB 95
	DB 101
	DB 110
	DB 100
	DB 58
	DB 32
	DB 32
	DB 32
	DB 32
	DB 32
	DB 32
	DB 32
	DB 32
	DB 0

.mstr.4:                                 ; @.mstr.4
	DB 32
	DB 32
	DB 111
	DB 108
	DB 100
	DB 95
	DB 115
	DB 105
	DB 122
	DB 101
	DB 58
	DB 32
	DB 32
	DB 32
	DB 32
	DB 32
	DB 32
	DB 32
	DB 0

.mstr.5:                                 ; @.mstr.5
	DB 32
	DB 32
	DB 70
	DB 97
	DB 115
	DB 116
	DB 45
	DB 112
	DB 97
	DB 116
	DB 104
	DB 32
	DB 99
	DB 104
	DB 101
	DB 99
	DB 107
	DB 58
	DB 32
	DB 77
	DB 65
	DB 84
	DB 67
	DB 72
	DB 10
	DB 0

.mstr.6:                                 ; @.mstr.6
	DB 32
	DB 32
	DB 70
	DB 97
	DB 115
	DB 116
	DB 45
	DB 112
	DB 97
	DB 116
	DB 104
	DB 32
	DB 99
	DB 104
	DB 101
	DB 99
	DB 107
	DB 58
	DB 32
	DB 77
	DB 73
	DB 83
	DB 77
	DB 65
	DB 84
	DB 67
	DB 72
	DB 32
	DB 40
	DB 71
	DB 111
	DB 105
	DB 110
	DB 103
	DB 32
	DB 116
	DB 111
	DB 32
	DB 115
	DB 98
	DB 114
	DB 107
	DB 32
	DB 50
	DB 41
	DB 10
	DB 0

.mstr.7:                                 ; @.mstr.7
	DB 91
	DB 115
	DB 89
	DB 83
	DB 77
	DB 65
	DB 76
	DB 76
	DB 79
	DB 99
	DB 32
	DB 69
	DB 120
	DB 105
	DB 116
	DB 93
	DB 10
	DB 0

.mstr.8:                                 ; @.mstr.8
	DB 32
	DB 32
	DB 70
	DB 105
	DB 110
	DB 97
	DB 108
	DB 32
	DB 97
	DB 118
	DB 45
	DB 62
	DB 116
	DB 111
	DB 112
	DB 58
	DB 32
	DB 32
	DB 0

.mstr.9:                                 ; @.mstr.9
	DB 32
	DB 32
	DB 67
	DB 97
	DB 108
	DB 99
	DB 117
	DB 108
	DB 97
	DB 116
	DB 101
	DB 100
	DB 32
	DB 115
	DB 105
	DB 122
	DB 101
	DB 58
	DB 0

.mstr.10:                                ; @.mstr.10
	DB 32
	DB 32
	DB 82
	DB 101
	DB 113
	DB 117
	DB 101
	DB 115
	DB 116
	DB 101
	DB 100
	DB 32
	DB 110
	DB 98
	DB 58
	DB 32
	DB 32
	DB 32
	DB 0

.mstr.11:                                ; @.mstr.11
	DB 69
	DB 110
	DB 116
	DB 101
	DB 114
	DB 101
	DB 100
	DB 32
	DB 109
	DB 97
	DB 108
	DB 108
	DB 111
	DB 99
	DB 95
	DB 105
	DB 110
	DB 105
	DB 116
	DB 95
	DB 115
	DB 116
	DB 97
	DB 116
	DB 101
	DB 0

