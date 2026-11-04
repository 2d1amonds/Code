#include <stdio.h>
#include <stdlib.h>

int euklidesMod(int a, int b) {
    a = abs(a);
    b = abs(b);

    while (a && b) {
        if (a > b) a %= b;
        else b %= a;
    }
    return a ? a : b;
}

int main() {
    int a = 0;
    int b = 0;

    printf("Podaj liczbe a: ");
    scanf("%d", &a);

    printf("Podaj liczbe b: ");
    scanf("%d", &b);

    printf("NWD %d i %d to %d", a, b, euklidesMod(a, b));

    return 0;
}