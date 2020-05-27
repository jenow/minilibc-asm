#include <stdlib.h>
#include <stdio.h>

extern int strcm(const char*, const char*);

int main() {
  printf("%s\n", strcm("5678", "5678"));
}
