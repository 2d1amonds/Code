#include <math.h>
#include <stdio.h>

int euklides(int a, int b) {
    while(a != b) {
        if(a > b) a -= b;
        else b -= a;
    }
    return a;
} 

int euklidesMod(int a, int b) {
    while(a && b) {
        if(a > b) a = a % b;
        else b %= a;
    }
    return a ? a : b;
}

void rowKwad() {
    double a = 0.0;
    double b = 0.0;
    double c = 0.0;

    printf("Podaj a\n");
    scanf("%lf", &a);

    printf("Podaj b\n");
    scanf("%lf", &b);

    printf("Podaj c\n");
    scanf("%lf", &c);

    if(a == 0) {
        printf("a musi byc różne od 0\n");
        return;
    }

    double delta = (b * b) - (4 * a * c);
    if(delta > 0) {
        double p = sqrt(delta);
        double x1 = (-b + p) / (2*a);
        double x2 = (-b - p) / (2*a);
        printf("x1 = %f, x2 = %f\n", x1, x2);
    } else if(delta == 0) {
        double x = -b / (2*a);
        printf("x = %f\n", x);
    } else {
        printf("Działanie nie ma rozwiazania w zbiorze R\n");
    }
}

void isPalindrome(int n, int p) {
    if(n < 0) {
        printf("False\n");
        return;
    }
    int reversed_num = 0;
    int number = n;

    while(number != 0) {
        reversed_num = reversed_num * p + number % p;
        number /= p;
    }
    printf("%s\n", n == reversed_num ? "True" : "False");
}


int main() {
    int euk = euklides(15, 26);
    printf("%d\n", euk);

    int modEuk = euklidesMod(15,26);
    printf("%d\n", modEuk);

    rowKwad();

    isPalindrome(124421, 4);

    return 0;
}