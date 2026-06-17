#include <sys/types.h>
#include "malloc.h"
#include <stdint.h>


enum {
    SC32_ADDR_ROM_START = 0x000000,
    SC32_ADDR_ROM_END = 0x3FFFFF,
    SC32_ADDR_IO_START = 0x400000,
    SC32_ADDR_IO_END = 0x7FFFFF,
    SC32_ADDR_IO_TERM = 0x400001,
    SC32_ADDR_IO_KB   = 0x400002,
    SC32_ADDR_RAM_START = 0x800000,
    SC32_ADDR_RAM_HEAP_START = 0x800400,
    SC32_ADDR_RAM_END = 0xFFFFFF,
};

#define SC32_REG_IO_TERM ((volatile char*)SC32_ADDR_IO_TERM)
#define SC32_REG_IO_KB   ((volatile char*)SC32_ADDR_IO_KB)

char* heap = (char *)0x800400;


void sc32_putc(unsigned char c);
void sc32_prints(unsigned char *c);
unsigned char *sc32_readline();

