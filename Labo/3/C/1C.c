#include <stdio.h>
#include <stdbool.h>

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

unsigned count_primes(bool s[], unsigned n) {
    int i, c = 0;
    for (i=2; i<=n; i++) {
        if (s[i]) c++;
    }
    return c;
}

unsigned primenumbers(unsigned n) {
    bool *sieve = malloc((n + 1) * sizeof(bool));
    if (!sieve) return 0;             

    compute_sieve(sieve, n);
    unsigned result = count_primes(sieve, n);

    free(sieve);
    return result;
}

int main() {
    int n;

    printf("Podaj liczbe calkowita n >= 2: ");
    if (scanf("%d", &n) != 1 || n < 2) {
        printf("Blad: n musi byc liczba calkowita >= 2.\n");
        return 1;
    }

    unsigned result = primenumbers((unsigned)n);
    if (result == 0) {
        printf("Blad: brak pamieci dla tak duzego n.\n");
        return 1;
    }

    printf("Liczba liczb pierwszych nie wiekszych od %d: %u\n", n, result);
    return 0;
}