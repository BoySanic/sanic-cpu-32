#include <stdint.h>
#include "sc32_std.h"


__attribute__((section(".main"))) int main() {
  while(1){
    unsigned char *string = sc32_readline();
    sc32_prints(string);
  }
  return 0;
}
