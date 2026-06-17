#include <stdint.h>
#include <stdbool.h>
#include "sc32_stdio.h"
#include "sc32_unistd.h"
#include "sc32_hw.h"

__attribute__((section(".main"))) int main() {
  sc32_prints("Clock addr: ");
  sc32_print_hex((uintptr_t)SC32_IO_CLK);
  sc32_putc('\n');
  sc32_prints("Stdout addr: ");
  sc32_print_hex((uintptr_t)SC32_IO_TERM);
  sc32_putc('\n');
  while(true){ 
    char *string = sc32_readline();
    sc32_putc('\n');
    uint32_t before = 0;
    uint32_t after = 0;
    sc32_read_clock(&before);
    sc32_prints(string);
    sc32_putc('\n');
    sc32_read_clock(&after);
    uint32_t diff = after - before;
    sc32_prints("clocks taken to print: ");
    sc32_print_dec(diff);
    sc32_putc('\n');
  }
  return 0;
}

//
// __attribute__((section(".main"))) int main() {
//     // --- TEST 1: Stack Buffer & Byte-Storing ---
//     char stack_buf[4];
//     stack_buf[0] = 'A';
//     stack_buf[1] = 'B';
//     stack_buf[2] = '\0';
//
//     sc32_prints("Testing Stack: ");
//     sc32_prints(stack_buf);
//     sc32_prints("\n");
//
//     // --- TEST 2: Heap Buffer & Malloc ---
//     char *heap_buf = malloc(16);
//     if (heap_buf != NULL) {
//         heap_buf[0] = 'X';
//         heap_buf[1] = 'Y';
//         heap_buf[2] = '\0';
//
//         sc32_prints("Testing Heap: ");
//         sc32_prints(heap_buf);
//         sc32_prints("\n");
//     } else {
//         sc32_prints("Heap Malloc Failed!\n");
//     }
//
//     while(1); // Freeze here so we can see the output cleanly
//     return 0;
// }
