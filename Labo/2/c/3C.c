#include <stdio.h>

void rozkladCzPierwsze(long long n) {
    printf("%lld=", n);
    int first = 1;                 // czy to pierwszy czynnik (bez '*' przed nim)

    for (long long p = 2; p * p <= n; p++) {
        if (n % p == 0) {
            int exp = 0;
            while (n % p == 0) {
                n /= p;
                exp++;
            }
            if (!first) printf("*");
            printf("%lld", p);
            if (exp > 1) printf("^%d", exp);   // potęga tylko gdy wykładnik > 1
            first = 0;
        }
    }

    if (n > 1) {                   // pozostały czynnik pierwszy większy od sqrt
        if (!first) printf("*");
        printf("%lld", n);
    }
    printf("\n");
}

int main(void) {
    long long n;

    printf("Podaj liczbe n: ");
    if (scanf("%lld", &n) != 1 || n < 2) {
        printf("Podaj liczbe calkowita >= 2.\n");
        return 1;
    }

    rozkladCzPierwsze(n);
    return 0;
}