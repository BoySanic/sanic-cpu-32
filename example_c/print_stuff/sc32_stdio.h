#ifndef SC32_STDIO_H
#define SC32_STDIO_H

#include <stddef.h>
#include <stdint.h>

void sc32_putc(char c);
char sc32_getc(void);
void sc32_print_hex(uintptr_t val);
void sc32_print_dec(uintptr_t val);
void sc32_prints(const char *s);
char* sc32_readline(void);

#endif
