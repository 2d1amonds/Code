#include <stdio.h>

int min(int a, int b) {
    if (a <= b) return a;
    return b;
}

int newton(int n, int k) {
    if (k > n - k) k = n - k;

    long long *row = malloc((k + 1) * sizeof(long long));
    if (!row) return -1;
    for (int j = 0; j <=k; j++) row[j] = 0;
    row[0] = 1;

    for (int i = 1; i < n + 1; i++) {
        for (int j = min(i, k); j > 0; j--) {
            row[j] = row[j] + row[j - 1];
        }
    }
    return row[k];
}

int main() {
    int n;
    int k;

    printf("Podaj liczbe n (n >= 0): ");
    if (scanf("%d", &n) != 1 || n < 0) {
        printf("Blad: n musi byc liczba calkowita >= 0.\n");
        return 1;
    }

    printf("Podaj liczbe k (0 <= k <= n): ");
    if (scanf("%d", &k) != 1 || k < 0 || k > n) {
        printf("Blad: k musi byc liczba calkowita z przedzialu 0..n.\n");
        return 1;
    }

    printf("C(%d, %d) = %lld\n", n, k, newton(n, k));
    return 0;
}
