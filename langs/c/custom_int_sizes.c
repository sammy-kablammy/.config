#include <stdio.h>

struct OnlyNeedFourBits {
    int num: 4;
};

int main(void) {
    int i;
    struct OnlyNeedFourBits fourbits;
    fourbits.num = 2;
    for (i = 0; i < 15; i++) {
        printf("%d ", fourbits.num++);
    }
    printf("\n");
    return 0;
}
