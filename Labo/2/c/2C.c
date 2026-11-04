#include <stdio.h>
#include <math.h>
#include <stdbool.h>

bool isPrime(int n) {
    if (n < 2) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;


    for (int i = 3; i <= sqrt(n); i += 2) {
        if (n % i == 0) return false;
    }
    return true;
}

int main() {
    int n = 0;

    printf("Podaj liczbe n: ");
    scanf("%d", &n);

    if (isPrime(n)) printf("Liczba %d jest pierwsza \n", n);
    else printf("Liczba %d NIE jest pierwsza \n", n);

    return 0;
}
