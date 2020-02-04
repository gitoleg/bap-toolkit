#include <stdlib.h>
#include <stdio.h>

static int MyTrue = 1;

void good() {
    int *p = malloc(42);
    if (MyTrue) {
        free(p);
        return;
    }
    printf("%d\n", *p);
}

void bad1() {
    int *p = malloc(42);
    if (MyTrue) {
        free(p);
    }
    printf("%d\n", *p);
}

void bad2() {
    int *p = malloc(42);
    int *q = realloc(p, 0);
    *p = 42;
    free(q);
}

int main() {
    good();
    bad1();
    bad2();
    return 0;
}
