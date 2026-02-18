
#include <string.h>
struct command {
  char* command_word;
  void (*command_func_ptr)(void);
};
void test_output(void) {
  *(volatile int*)0x00400001 = '!';
  return;
}
int test(char* cmd) {
  struct command test = {
    .command_word = "add",
    .command_func_ptr = test_output
  };
  if(strcmp(cmd, test.command_word)) {
    test.command_func_ptr();
  }
}
