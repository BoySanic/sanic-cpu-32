
int my_fma(int a, int b, int c) {
  return (a * b) + c;
}

int main(void) {
  int a = 64;
  int b = 128;
  int c = 5;
  return my_fma(a, b, c);
}
