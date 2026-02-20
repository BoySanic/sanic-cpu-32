#include "instructions.h"
#include "hashmap.h"
struct Operand createOperand(enum OperandType operand_type, int bit_width) {
  struct Operand result;
  result.type = operand_type;
  result.bit_offset = bit_width;
  return result;
}
struct Opcode *createOpcode(int machine_code, struct Operand op1,
                            struct Operand op2, struct Operand op3,
                            struct Operand op4) {
  struct Opcode *result = (struct Opcode *)malloc(sizeof(struct Opcode));
  struct Opcode final = {machine_code,
                         (struct Operand *)malloc(sizeof(struct Operand) * 4)};
  final.operands[0] = op1;
  final.operands[1] = op2;
  final.operands[2] = op3;
  final.operands[3] = op4;
  return result;
}
struct hashMap *build_instructiontable() {

  /*
   * RegSpacer is an Operand where we just don't care about the bits in that
   * operand slot. Ignore them. For example: CALL uses a RegSpacer. This is so
   * that we can give one operand as a programmer, and have it spaced in the
   * instruction so it's the 2nd register instead of the 1st.
   *
   */
  struct Operand Register = createOperand(Operand_Register, 5);
  struct Operand Imm15 = createOperand(Operand_Immediate, 15);
  struct Operand Imm16 = createOperand(Operand_Immediate, 16);
  struct Operand Imm20 = createOperand(Operand_Immediate, 20);
  struct Operand RegSpacer = createOperand(Operand_Spacer, 5);
  struct Operand None = createOperand(Operand_None, 0);

  struct hashMap *instruction_table =
      (struct hashMap *)malloc(sizeof(struct hashMap));
  initializeHashMap(instruction_table);
  insert(instruction_table, "NOP", createOpcode(0, None, None, None, None));
  insert(instruction_table, "CALL",
         createOpcode(16, RegSpacer, Register, None, None));
  insert(instruction_table, "CALLI",
         createOpcode(17, RegSpacer, Imm16, None, None));
  insert(instruction_table, "RET", createOpcode(18, None, None, None, None));
  insert(instruction_table, "PUSH",
         createOpcode(19, Register, None, None, None));
  insert(instruction_table, "POP",
         createOpcode(20, Register, None, None, None));
  insert(instruction_table, "BR",
         createOpcode(32, Register, Register, None, None));
  insert(instruction_table, "BEQ",
         createOpcode(33, Register, Register, None, None));
  insert(instruction_table, "BNE",
         createOpcode(34, Register, Register, None, None));
  insert(instruction_table, "BLE",
         createOpcode(35, Register, Register, None, None));
  insert(instruction_table, "BLT",
         createOpcode(36, Register, Register, None, None));
  insert(instruction_table, "BGT",
         createOpcode(37, Register, Register, None, None));
  insert(instruction_table, "BGE",
         createOpcode(38, Register, Register, None, None));
  insert(instruction_table, "BLEU",
         createOpcode(39, Register, Register, None, None));
  insert(instruction_table, "BLTU",
         createOpcode(40, Register, Register, None, None));
  insert(instruction_table, "BGEU",
         createOpcode(41, Register, Register, None, None));
  insert(instruction_table, "BGTU",
         createOpcode(42, Register, Register, None, None));

  insert(instruction_table, "JMP",
         createOpcode(48, Register, Imm16, None, None));
  insert(instruction_table, "JEQ",
         createOpcode(49, Register, Imm16, None, None));
  insert(instruction_table, "JNE",
         createOpcode(50, Register, Imm16, None, None));
  insert(instruction_table, "JLE",
         createOpcode(51, Register, Imm16, None, None));
  insert(instruction_table, "JLT",
         createOpcode(52, Register, Imm16, None, None));
  insert(instruction_table, "JGT",
         createOpcode(53, Register, Imm16, None, None));
  insert(instruction_table, "JGE",
         createOpcode(54, Register, Imm16, None, None));
  insert(instruction_table, "JLEU",
         createOpcode(55, Register, Imm16, None, None));
  insert(instruction_table, "JLTU",
         createOpcode(56, Register, Imm16, None, None));
  insert(instruction_table, "JGEU",
         createOpcode(57, Register, Imm16, None, None));
  insert(instruction_table, "JGTU",
         createOpcode(58, Register, Imm16, None, None));
  insert(instruction_table, "ADD",
         createOpcode(64, Register, Register, None, None));
  insert(instruction_table, "SUB",
         createOpcode(65, Register, Register, None, None));
  insert(instruction_table, "MUL",
         createOpcode(66, Register, Register, None, None));
  insert(instruction_table, "DIV",
         createOpcode(67, Register, Register, None, None));
  insert(instruction_table, "AND",
         createOpcode(68, Register, Register, None, None));
  insert(instruction_table, "OR",
         createOpcode(69, Register, Register, None, None));
  insert(instruction_table, "XOR",
         createOpcode(70, Register, Register, None, None));
  insert(instruction_table, "SHL",
         createOpcode(71, Register, Register, None, None));
  insert(instruction_table, "SHR",
         createOpcode(72, Register, Register, None, None));
  insert(instruction_table, "SRA",
         createOpcode(73, Register, Register, None, None));

  insert(instruction_table, "ADDI",
         createOpcode(80, Register, Imm20, None, None));
  insert(instruction_table, "SUBI",
         createOpcode(81, Register, Imm20, None, None));
  insert(instruction_table, "MULI",
         createOpcode(82, Register, Imm20, None, None));
  insert(instruction_table, "DIVI",
         createOpcode(83, Register, Imm20, None, None));
  insert(instruction_table, "ANDI",
         createOpcode(84, Register, Imm20, None, None));
  insert(instruction_table, "ORI",
         createOpcode(85, Register, Imm20, None, None));
  insert(instruction_table, "XORI",
         createOpcode(86, Register, Imm20, None, None));
  insert(instruction_table, "SHLI",
         createOpcode(87, Register, Imm20, None, None));
  insert(instruction_table, "SHRI",
         createOpcode(88, Register, Imm20, None, None));
  insert(instruction_table, "SRAI",
         createOpcode(89, Register, Imm20, None, None));
  insert(instruction_table, "LD",
         createOpcode(96, Register, Register, Imm15, None));
  insert(instruction_table, "LDB",
         createOpcode(97, Register, Register, Imm15, None));
  insert(instruction_table, "ST",
         createOpcode(98, Register, Register, Imm15, None));
  insert(instruction_table, "STB",
         createOpcode(99, Register, Register, Imm15, None));
  insert(instruction_table, "LUI",
         createOpcode(100, Register, Imm16, None, None));
  insert(instruction_table, "LLI",
         createOpcode(101, Register, Imm16, None, None));
  insert(instruction_table, "NOT",
         createOpcode(102, Register, None, None, None));
  insert(instruction_table, "CMP",
         createOpcode(103, Register, Register, None, None));
  insert(instruction_table, "MOV",
         createOpcode(104, Register, Register, None, None));
  insert(instruction_table, "AMOV",
         createOpcode(105, Register, None, None, None));
  return instruction_table;
}
