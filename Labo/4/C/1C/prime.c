#include <stdlib.h>
#include "prime.h"

bool IsPrime(long long n) {
    if (n < 2) {
        return false;
    }
    if (n < 4) {
        return true;
    }
    if (n % 2 == 0) {
        return false;
    }
    for (long long i = 3; i <= n/i; i+= 2) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}

static void compute_sieve(bool s[], long long n) {
    long long i, j;
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

static long long count_primes(bool s[], long long n) {
    long long i, c = 0;
    for (i=2; i<=n; i++) {
        if (s[i]) c++;
    }
    return c;
}

long long PrimeNumbers(long long n) {
    if (n < 2) return 0;

    bool *sieve = calloc(n + 1, sizeof *sieve);
    if (!sieve) return -1;

    compute_sieve(sieve, n);
    long long wynik = count_primes(sieve, n);
    free(sieve);
    return wynik;
}

static bool IsNotDivisible(long long n, long long *primes, long long count) {
    for (int i = 0; i < count; i++) {
        long long d = primes[i];
        if (d > n/d) {
            break;
        }
        if (n % d == 0) {
            return false;
        }
    }
    return true;
}

long long Prime(long long n) {
    if (n < 1) {
        return -1;
    }
    long long *primes = malloc(n * sizeof *primes);
    if (!primes) return -1;

    primes[0] = 2;
    long long l = 3;
    long long count = 1;

    while (count < n) {
        if (IsNotDivisible(l, primes, count)) {
            primes[count] = l;
            count += 1;
        }
        l += 2;
    }
    long long result = primes[n - 1];
    free(primes);
    return result;
}