#include "hashmap.h"
#include "instructions.h"
#include <stdio.h>
#include <string.h>
#define BUF_SIZE (1 << 16)
int main(int argc, char *argv[]) {
  char *output_filepath;
  char *assembly_filepath = argv[1]; // First argument, positional
  char buffer[BUF_SIZE];
  for (int i = 2; i < argc; i++) {
    if (strcmp(argv[i], "-o") == 0 || strcmp(argv[i], "--out") == 0) {
      output_filepath = argv[++i];
    }
  }
  FILE *assembly_file = fopen(assembly_filepath, "r");
  if (assembly_file == NULL) {
    perror("Error opening assembly input file.");
    return 1;
  }
  struct hashMap *instruction_table = build_instructiontable();
  int lines = 0;
  while (fgets(buffer, BUF_SIZE, assembly_file) != NULL) {
    // remove the newline
    buffer[strcspn(buffer, "\n")] = '\0';
    // Find first space, we need the first substring for the opcode lookup
    int opcode_end_index = strcspn(buffer, " ");
    char opcode_text[6];
    strncpy(opcode_text, buffer, opcode_end_index - 1);
    opcode_text[opcode_end_index] = '\0';
    struct Opcode *opcode_obj = search(instruction_table, opcode_text);

    lines++;
  }
}

/*
 * Instruction struct:
 *
 * Opcode
 * Operand, Operand, Operand, Operand
 */
/*
 * Assembler stages:
 *
 *
 * 1. Preprocessing
 *   - Assign every instruction a sequential value (just toss them
 * in an array), the sequential value is the index in that array
 *   - Separately list labels with their referenced instruction address for
 * later.
 * 2. Opcode checking
 *   - Make sure the opcodes all exist in the first place.
 *   - This is also where we'll check for pseudoinstructions. It'll fall through
 * into a flow where it can check secondary places for pseudoinstructions that
 * don't have hardware analogues and do something specific.
 *   - It's an error if it's neither an instruction or a pseudoinstruction.
 *     - The BD pseudoinstruction will be how we store data in the binary. It'll
 * write a char* containing the raw binary data, to be added to the end of the
 *       instruction list.
 *     - Once we've processed BD, place the old instruction addr and the new
 * data address in some kind of storage we can check later.
 * 3. Operand checking
 *   - Check that the operand strings given make sense for the operands of the
 * opcode.
 *      - For instance, an operand wants a Register, but it's given an
 * immediate. That should be an error.
 *   - Bit widths for explicitly given immediates match the operands for the
 * opcode
 *   - Referenced registers exist
 * 4. Label replacement/readdressing
 *   - For each instruction addr in the list, if an instruction addr (index) has
 * no data, it's dead.
 *   - If the instruction addr is not empty, look for labels that referenced it.
 * Replace their referenced addresses.
 *   - If the label's address doesn't exist anymore, check the BD old-new
 * address pairs. If you find a match, replace the label's referenced address
 * with this new address.
 * 5. Now that we've checked all these things:
 *   - Convert from ascii digits to decimal digits to construct an integer
 * (immediates)
 *   - Convert opcodes into their machine code form
 *   - Convert operands into machine code form, create 32-bit integer
 * representing the instruction
 *   - Append the 32-bit integer to
 */
