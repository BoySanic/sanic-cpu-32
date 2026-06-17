#include "sc32_stdio.h"

__attribute__((section(".main"))) int main() {
  char buf[3];
  buf[0] = 'A';
  buf[1] = 'B';
  buf[2] = '\0';
  sc32_prints(buf);
}
