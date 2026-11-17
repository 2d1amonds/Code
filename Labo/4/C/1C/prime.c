#include <stdlib.h>
#include "prime.h"

bool IsPrime(unsigned n) {
    if (n < 2) {
        return false;
    }
    if (n < 4) {
        return true;
    }
    if (n % 2 == 0) {
        return false;
    }
    for (unsigned i = 3; i <= n/i; i+= 2) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}

static void compute_sieve(bool s[], unsigned n) {
    unsigned i, j;
    s[0] = false;
    s[1] = false;
    for (i=2; i <= n; i++) s[i] = true;
    for (i=2; i <= n/i; i++) {
        if (s[i]) {
            for (j=i*i; j <= n; j +=i) {
                s[j] = false;
            }
        }
    }
}

static unsigned count_primes(bool s[], unsigned n) {
    unsigned i, c = 0;
    for (i=2; i<=n; i++) {
        if (s[i]) c++;
    }
    return c;
}

unsigned PrimeNumbers(unsigned n) {
    if (n < 2) return 0;

    bool *sieve = calloc(n + 1, sizeof *sieve);
    if (!sieve) return -1;

    compute_sieve(sieve, n);
    unsigned wynik = count_primes(sieve, n);
    free(sieve);
    return wynik;
}

static bool IsNotDivisible(unsigned n, unsigned *primes, unsigned count) {
    for (unsigned i = 0; i < count; i++) {
        unsigned d = primes[i];
        if (d > n/d) {
            break;
        }
        if (n % d == 0) {
            return false;
        }
    }
    return true;
}

unsigned Prime(unsigned n) {
    if (n < 1) {
        return -1;
    }
    unsigned *primes = malloc(n * sizeof *primes);
    if (!primes) return -1;

    primes[0] = 2;
    unsigned l = 3;
    unsigned count = 1;

    while (count < n) {
        if (IsNotDivisible(l, primes, count)) {
            primes[count] = l;
            count += 1;
        }
        l += 2;
    }
    unsigned result = primes[n - 1];
    free(primes);
    return result;
}