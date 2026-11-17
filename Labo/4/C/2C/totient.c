#include "totient.h"

unsigned Totient(unsigned n) {
    if (n < 1) return -1;

    unsigned result = n;
    unsigned p = 2;

    while (p <= n/p) {
        if (n % p == 0) {
            while (n % p == 0) {
                n /= p;
            }
            result -= result / p;
        }
        p++;
    }

    if (n > 1) {
        result -= result / n;
    }

    return result;
}