#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

bool isPrime(unsigned n, unsigned *primes, int count) {
    double limit = sqrt(n);

    for (int i = 0; i < count; i++) {
        unsigned d = primes[i];
        if (d > limit) {
            break;
        }
        if (n % d == 0) {
            return false;
        }
    }
    return true;
}

unsigned *nLiczbP(int n) {
    if (n < 1) {
        return NULL;
    }

    unsigned *primes = malloc(n * sizeof *primes);

    primes[0] = 2;
    unsigned l = 3;
    int count = 1;

    while (count < n) {
        if (isPrime(l, primes, count)) {
            primes[count] = l;
            count += 1;
        }
        l += 2;
    }
    return primes;
}

int main() {
    int n;

    printf("Podaj liczbe n >= 1, aby wypisac n liczb pierwszych: ");
    if (scanf("%d", &n) != 1 || n < 1) {
        printf("n musi byc >= 1.\n");
        return 1;
    }

    unsigned *result = nLiczbP(n);

    printf("[");
    for (int i = 0; i < n; i++) {
        printf(i ? ", %u" : "%u", result[i]);
    }
    printf("]\n");

    free(result);
    return 0;
}