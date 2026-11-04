#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

unsigned upper_bound(int n) {
    if (n < 6) return 15;
    return (int)(n * (log(n) + log(log(n)))) + 1;
}

void compute_sieve(bool s[], unsigned n) {
    unsigned i, j;
    s[0] = false;
    s[1] = false;
    for (i=2; i <= n; i++) s[i] = true;
    for (i=2; i <= n; i++) {
        if (s[i]) {
            for (j=i+i; j <= n; j +=i) {
                s[j] = false;
            }
        }
    }
}

unsigned find_nth(bool s[],unsigned limit, unsigned n) {
    unsigned c = 0;
    for (unsigned i=0; i<= limit; i++) {
        if (s[i]) {
            c++;
            if (c == n) {
                return i;
            }
        }
    }
    return 0;
}

unsigned primenumbers(unsigned n) {
    unsigned limit = upper_bound(n);
    bool *sieve = malloc((limit + 1) * sizeof(bool));
    if (!sieve) return 0;

    compute_sieve(sieve, limit);
    unsigned result = find_nth(sieve, limit, n);

    free(sieve);
    return result;
}

int main() {
    int n;

    printf("Podaj liczbe calkowita n >= 1: ");
    if (scanf("%d", &n) != 1 || n < 1) {
        printf("Blad: n musi byc liczba calkowita >= 1.\n");
        return 1;
    }

    unsigned result = primenumbers((unsigned)n);
    if (result == 0) {
        printf("Blad: brak pamieci dla tak duzego n.\n");
        return 1;
    }

    printf("%d-ta liczba pierwsza to %u\n", n, result);
    return 0;
}