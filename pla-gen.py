from enum import Enum


class OpCode(Enum):
    HALT = 0
    NOP = 1

    CALL = 16
    RET  = 17
    PUSH = 18
    POP = 19

    BR = 32
    BEQ = 33
    BNE = 34
    BLE = 35
    BLT = 36
    BGT = 37
    BGE = 38
    BLEU = 39
    BLTU = 40
    BGEU = 41
    BGTU = 42

    JMP = 48
    JEQ = 49
    JNE = 50
    JLE = 51
    JLT = 52
    JGT = 53
    JGE = 54
    JLEU = 55
    JLTU = 56
    JGEU = 57
    JGTU = 58

    ADD = 64
    SUB = 65
    MUL = 66
    DIV = 67
    AND = 68
    OR = 69
    XOR = 70
    SHL = 71
    SHR = 72

    ADDI = 80
    SUBI = 81
    MULI = 82
    DIVI = 83
    ANDI = 84
    ORI = 85
    XORI = 86
    SHLI = 87
    SHRI = 88

    LD = 96
    ST = 97
    LUI = 98
    LLI = 99
    NOT = 100
    CMP = 101
    MOV = 102

class MicroOp(Enum):
    REG_B_SEL_SP     = 0b000000000000000000000000001
    B_TO_PC          = 0b000000000000000000000000010 # Used solely for call
    CONDITION_EQ     = 0b000000000000000000001101000
    CONDITION_NE     = 0b000000000000000000001100100
    CONDITION_LE     = 0b000000000000000000001100000
    CONDITION_LT     = 0b000000000000000000001011100
    CONDITION_GT     = 0b000000000000000000001011000
    CONDITION_GE     = 0b000000000000000000001010100
    CONDITION_LEU    = 0b000000000000000000001010000
    CONDITION_LTU    = 0b000000000000000000001001100
    CONDITION_GEU    = 0b000000000000000000001001000
    CONDITION_GTU    = 0b000000000000000000001000100
    CONDITION_ALWAYS = 0b000000000000000000001000000 # Used as a cludge on Push to direct data where it must go
    HALT             = 0b000000000000000000010000000 # Repurpose me, currently used as a no-op for Pop
    MEM_WRITE_ENABLE = 0b000000000000000000100000000
    PC_RELATIVE_ADDR = 0b000000000000000001000000000
    ZERO_TO_A        = 0b000000000000000110000000000 # Push 0 constant to register, used for LLI and LUI
    IMM_TO_A         = 0b000000000000000010000000000
    INVERT_REG_A     = 0b000000000000000100000000000
    PC_WRITE_ENABLE  = 0b000000000000001000000000000
    IMM_USE_LOWER16  = 0b000000000000010000000000000
    # MOV micro-ops (2-bit encoded)
    REG_B_TO_A       = 0b000000000000000000000000000
    MEM_TO_A         = 0b000000000000100000000000000
    ALU_TO_A         = 0b000000000001000000000000000
    AUX_TO_A         = 0b000000000001100000000000000
    #
    ADD_ALU          = 0b000000000010000000000000000  # Rename, it's used for return/pop
    SUB_ALU          = 0b000000000100000000000000000  # Rename, it's used for call/push/cmp
    REG_CLEAR_ENABLE = 0b000000001000000000000000000  # Repurpose me
    NEXT_INSTRUCTION = 0b000000010000000000000000000
    REG_WRITE_ENABLE = 0b000000100000000000000000000
    REG_A_SEL_SP     = 0b000001000000000000000000000  # Select stack pointer register for reg a
    REG_READ_B       = 0b000010000000000000000000000  # Only used in control unit 
    ALU_ENABLE       = 0b000100000000000000000000000
    HARDCODE_1_OP_B  = 0b001000000000000000000000000  # Used for Call to decrement the stack pointer
    PC_TO_MEM        = 0b010000000000000000000000000  # Routes program counter value directly to memory data bus, no offset
    MEM_ADDR_EMIT    = 0b100000000000000000000000000  # Used for stores/loads to prevent emitting the memory address when not needed, improves peripheral compatibility

class Instruction:
    shorthand = OpCode.ADD
    clock0 = []
    clock1 = []
    clock2 = []
    clock3 = []
    def __init__(self, shorthand, clock0, clock1=None, clock2=None, clock3=None):
        self.shorthand = shorthand
        self.clock0 = clock0
        self.clock1 = clock1
        self.clock2 = clock2
        self.clock3 = clock3



# Register A = 1st set of bits (5-7)
# Register B = 2nd set of bits (8-10)



instructions = [
    Instruction(OpCode.NOP,     MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.CALL,    [MicroOp.REG_A_SEL_SP, MicroOp.SUB_ALU, MicroOp.HARDCODE_1_OP_B, MicroOp.ALU_TO_A, MicroOp.REG_WRITE_ENABLE], 
                                [MicroOp.REG_A_SEL_SP, MicroOp.B_TO_PC, MicroOp.PC_WRITE_ENABLE, MicroOp.PC_TO_MEM, MicroOp.MEM_WRITE_ENABLE],
                                MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.RET,     [MicroOp.REG_A_SEL_SP, MicroOp.MEM_TO_A, MicroOp.MEM_ADDR_EMIT, MicroOp.REG_WRITE_ENABLE], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.PUSH,    [MicroOp.REG_A_SEL_SP, MicroOp.SUB_ALU, MicroOp.HARDCODE_1_OP_B, MicroOp.ALU_TO_A, MicroOp.REG_WRITE_ENABLE],
                                [MicroOp.REG_A_SEL_SP, MicroOp.REG_READ_B, MicroOp.CONDITION_ALWAYS, MicroOp.MEM_ADDR_EMIT, MicroOp.MEM_WRITE_ENABLE],
                                MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.POP,     [MicroOp.REG_B_SEL_SP, MicroOp.MEM_TO_A, MicroOp.MEM_ADDR_EMIT, MicroOp.REG_WRITE_ENABLE],
                                [MicroOp.REG_A_SEL_SP, MicroOp.ADD_ALU, MicroOp.HARDCODE_1_OP_B, MicroOp.ALU_TO_A, MicroOp.REG_WRITE_ENABLE],
                                MicroOp.NEXT_INSTRUCTION),

    Instruction(OpCode.ADD,     [MicroOp.REG_READ_B, MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.SUB,     [MicroOp.REG_READ_B, MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.MUL,     [MicroOp.REG_READ_B, MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.DIV,     [MicroOp.REG_READ_B, MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.AND,     [MicroOp.REG_READ_B, MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.OR,      [MicroOp.REG_READ_B, MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.XOR,     [MicroOp.REG_READ_B, MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    
    Instruction(OpCode.ADDI,    [MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.SUBI,    [MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.MULI,    [MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.DIVI,    [MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.ANDI,    [MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.ORI,     [MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.XORI,    [MicroOp.ALU_ENABLE, MicroOp.REG_WRITE_ENABLE, MicroOp.ALU_TO_A, MicroOp.NEXT_INSTRUCTION]),
    
    Instruction(OpCode.CMP,     [MicroOp.REG_READ_B, MicroOp.SUB_ALU, MicroOp.ALU_ENABLE, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.BR,      [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_ALWAYS],  MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.BEQ,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_EQ], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.BNE,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_NE], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.BLE,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_LE], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.BLT,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_LT], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.BGT,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_GT], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.BGE,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_GE], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.BLEU,    [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_LEU], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.BLTU,    [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_LTU], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.BGEU,    [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_GEU], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.BGTU,    [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_GTU], MicroOp.NEXT_INSTRUCTION),
    
    Instruction(OpCode.JMP,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_ALWAYS, MicroOp.PC_RELATIVE_ADDR], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.JEQ,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_EQ, MicroOp.PC_RELATIVE_ADDR], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.JNE,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_NE, MicroOp.PC_RELATIVE_ADDR], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.JLE,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_LE, MicroOp.PC_RELATIVE_ADDR], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.JLT,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_LT, MicroOp.PC_RELATIVE_ADDR], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.JGT,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_GT, MicroOp.PC_RELATIVE_ADDR], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.JGE,     [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_GE, MicroOp.PC_RELATIVE_ADDR], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.JLEU,    [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_LEU, MicroOp.PC_RELATIVE_ADDR], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.JLTU,    [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_LTU, MicroOp.PC_RELATIVE_ADDR], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.JGEU,    [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_GEU, MicroOp.PC_RELATIVE_ADDR], MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.JGTU,    [MicroOp.PC_WRITE_ENABLE,  MicroOp.CONDITION_GTU, MicroOp.PC_RELATIVE_ADDR], MicroOp.NEXT_INSTRUCTION),
    
    Instruction(OpCode.LD,      [MicroOp.REG_READ_B,       MicroOp.MEM_TO_A, MicroOp.MEM_ADDR_EMIT, MicroOp.REG_WRITE_ENABLE],  MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.ST,      [MicroOp.REG_READ_B, MicroOp.MEM_ADDR_EMIT, MicroOp.MEM_WRITE_ENABLE],  MicroOp.NEXT_INSTRUCTION),
    Instruction(OpCode.LUI,     [MicroOp.ZERO_TO_A, MicroOp.REG_WRITE_ENABLE], [MicroOp.REG_WRITE_ENABLE, MicroOp.IMM_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.LLI,     [MicroOp.ZERO_TO_A, MicroOp.REG_WRITE_ENABLE], [MicroOp.REG_WRITE_ENABLE, MicroOp.IMM_USE_LOWER16, MicroOp.IMM_TO_A, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.NOT,     [MicroOp.INVERT_REG_A, MicroOp.REG_WRITE_ENABLE, MicroOp.NEXT_INSTRUCTION]),
    Instruction(OpCode.MOV,     [MicroOp.REG_READ_B,       MicroOp.REG_WRITE_ENABLE], MicroOp.NEXT_INSTRUCTION)
]

opcode_pad_width = len(MicroOp)-9
opcode_width = 7
cycle_width = 2
micro_op_width = opcode_width + cycle_width

with open("pla.txt", "w") as file:
    for instruction in instructions:
        combined_op = 0b0
        if isinstance(instruction.clock0, list):
            for op in instruction.clock0:
                if op != None:
                    combined_op |= op.value
        else:
            if(instruction.clock0 != None):
                combined_op |= instruction.clock0.value
        if(instruction.clock0 != None):
            binary_string = format(combined_op, f"0{opcode_pad_width}b")
            op_string = format(instruction.shorthand.value,             f"0{micro_op_width}b")
            file.write(op_string + " " + binary_string + "\n")
        combined_op = 0b0
        if isinstance(instruction.clock1, list):
            for op in instruction.clock1:
                if op != None:
                    combined_op |= op.value
        else:
            if(instruction.clock1 != None):
                combined_op |= instruction.clock1.value
        if(instruction.clock1 != None):
            binary_string = format(combined_op, f"0{opcode_pad_width}b")
            op_string = format(instruction.shorthand.value + 0b010000000, f"0{micro_op_width}b")
            file.write(op_string + " " + binary_string + "\n")
        combined_op = 0b0
        if isinstance(instruction.clock2, list):
            for op in instruction.clock2:
                if op != None:
                    combined_op |= op.value
        else:
            if(instruction.clock2 != None):
                combined_op |= instruction.clock2.value
        if(instruction.clock2 != None):
            binary_string = format(combined_op, f"0{opcode_pad_width}b")
            op_string = format(instruction.shorthand.value + 0b100000000, f"0{micro_op_width}b")
            file.write(op_string + " " + binary_string + "\n")
        combined_op = 0b0
        if isinstance(instruction.clock3, list):
            for op in instruction.clock3:
                if op != None:
                    combined_op |= op.value
        else:
            if(instruction.clock3 != None):
                combined_op |= instruction.clock3.value
        if(instruction.clock3 != None):
            binary_string = format(combined_op, f"0{opcode_pad_width}b")
            op_string = format(instruction.shorthand.value + 0b110000000, f"0{micro_op_width}b")
            file.write(op_string + " " + binary_string + "\n")
        combined_op = 0b0
