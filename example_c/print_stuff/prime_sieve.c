#include "sc32_stdio.h"
#include "sc32_unistd.h"
#include "sc32_memory.h"
#include "malloc.h"
#include <stdbool.h>


int sieve(int **results, int n) {

  bool *prime = (bool *)malloc(sizeof(bool)*(n+1));
  if (prime == NULL) {
    sc32_prints("Error: malloc failed to allocate sieve array!\n");
    return -1;
  }
  int total_primes = 0;
  for (int i = 0; i < n+1; i++) {
    prime[i] = true;
  }
  for (int p = 2; p * p <= n; p++) {
    if(prime[p] == true) {
      for(int i = p * p; i <= n; i += p) {
        prime[i] = false;
      }
    }
  }
  for (int i = 0; i < n+1; i++) {
    if(prime[i]) {
      total_primes++;
    }
  }
  *results = (int *)malloc(sizeof(int)*total_primes);
  if (*results == NULL) {
    sc32_prints("Error: malloc failed to allocate results array!\n");
    free(prime); // Clean up if your dlmalloc supports it
    return -1;
  }
  int res_index = 0;
  for (int p = 2; p <= n; p++) {
    if (prime[p]){
        (*results)[res_index] = p;
        res_index++;
    }
  }
  free(prime);
  return res_index;

}

__attribute__((section(".main"))) int main(void) {
  int n = 5000;
  int *res = NULL;
  int clock_before = sc32_read_clock();
  int size = sieve(&res, n);
  int clock_after = sc32_read_clock();

  for(int i = 0; i < size; i++) {
    sc32_print_dec(res[i]);
    sc32_putc(' ');
  }
  sc32_prints("Execution finished. Clocks taken: ");
  sc32_print_dec(clock_after - clock_before);
  sc32_putc('\n');
}
