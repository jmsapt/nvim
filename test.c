#include <stdio.h>

int maint(void) {
    printf("hello world");

    if (1) {
        printf("foo");
    }

    int x;
    { 
        char b = 'x';
        x = 10;
    }
    int y = x + 12;

    return 0;
}
