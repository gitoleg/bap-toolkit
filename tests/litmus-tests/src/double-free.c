#include <stdlib.h>

static int MyTrue = 1;

void good() {
    int *p = malloc(42);
    if (MyTrue) {
        free(p);
        return;
    }
    free(p);
}

void bad1() {
    int *p = malloc(42);
    if (MyTrue) {
        free(p);
    }
    free(p);
}


void bad2() {
    int *p = malloc(42);
    int *q = realloc(p, 42); // p remains untouched and returned
    free(p);  // p freed first time
    free(q);  // p freed second time
}

void bad3() {
    int *p = malloc(42);
    int *q = realloc(p, 43); // p is freed first time
    free(p); // p is freed second time
    free(q);
}

int main() {
    good();
    bad1();
    bad2();
    bad3();
    return 0;
}
