#include "sc32_std.h"

void* sbrk(intptr_t increment) {
  char * old_heap = heap;

  if (heap + increment > &SC32_ADDR_)
  heap += increment;
  return old_heap;
}

void sc32_putc(unsigned char c) {
    *SC32_REG_IO_TERM = c;
}

void sc32_prints(unsigned char* s) {
    while (*s) {
        sc32_putc(*s++);
    }
}

unsigned char* sc32_readline() {
    size_t buf_size = 16;
    size_t str_size = 0;
    unsigned char *buf = malloc(buf_size);
    char input;

    do {
        input = *SC32_REG_IO_KB;
        if (input == '\n') {
            input = '\0';
        }

        if (str_size >= buf_size) {
            buf_size += 16;
            buf = realloc(buf, buf_size);
        }

        buf[str_size++] = input;
    } while (input != '\0');

    return buf;
}
