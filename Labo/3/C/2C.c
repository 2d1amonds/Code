#include <stdio.h>
#include <stdlib.h>

static int min(int a, int b) {
    if (a <= b) return a;
    return b;
}

long long newton(int n, int k) {
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
    long long result = row[k];
    free(row);
    return result;
}

int main() {
    int n;
    int k;

    printf("Podaj liczbe n (n >= 0): ");
    if (scanf("%d", &n) != 1 || n < 0) {
        printf("n musi byc >= 0\n");
        return 1;
    }

    printf("Podaj liczbe k (0 <= k <= n): ");
    if (scanf("%d", &k) != 1 || k < 0 || k > n) {
        printf("k musi byc >= 0 i k <= n\n");
        return 1;
    }

    printf("C(%d, %d) = %lld\n", n, k, newton(n, k));
    return 0;
}
