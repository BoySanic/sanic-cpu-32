#ifndef SC32_UNISTD_H
#define SC32_UNISTD_H

#include <stddef.h>
#include "dlmalloc/malloc.h"
#include <sys/types.h>
#include <stdint.h>
#include "sc32_memory.h"

// Low-level byte streams. Returns number of bytes processed.
int sc32_write(int fd, const char *buf, size_t count);
int sc32_read(int fd, char *buf, size_t count);
int sc32_read_clock();
#endif
