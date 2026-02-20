enum OperandType {
  Operand_Register = 0,
  Operand_Immediate = 1,
  Operand_Spacer = 2,
  Operand_None = 3
};
enum Register {
  Register_GP0 = 0,
  Register_GP1 = 1,
  Register_GP2 = 2,
  Register_GP3 = 3,
  Register_GP4 = 4,
  Register_GP5 = 5,
  Register_GP6 = 6,
  Register_GP7 = 7,
  Register_GP8 = 8,
  Register_GP9 = 9,
  Register_GP10 = 10,
  Register_GP11 = 11,
  Register_GP12 = 12,
  Register_GP13 = 13,
  Register_GP14 = 14,
  Register_GP15 = 15,
  Register_GP16 = 16,
  Register_GP17 = 17,
  Register_GP18 = 18,
  Register_GP19 = 19,
  Register_GP20 = 20,
  Register_GP21 = 21,
  Register_GP22 = 22,
  Register_GP23 = 23,
  Register_GP24 = 24,
  Register_GP25 = 25,
  Register_GP26 = 26,
  Register_GP27 = 27,
  Register_GP28 = 28,
  Register_GP29 = 29,
  Register_GP30 = 30,
  Register_GP31 = 31,
};

struct Operand {
  enum OperandType type;
  int bit_offset;
};

struct Opcode {
  int machine_code;
  struct Operand *operands;
};

struct hashMap *build_instructiontable();
struct Opcode *createOpcode(int machine_code, struct Operand op1,
                            struct Operand op2, struct Operand op3,
                            struct Operand op4);
