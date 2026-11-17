#include "prime.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc != 3 || 
        (strcmp(argv[1], "pn") != 0 &&
        strcmp(argv[1], "pr") != 0 &&
        strcmp(argv[1], "ip") != 0)) {
        fprintf(stderr, "uzycie: ./program {pn|pr|ip} liczba\n");
        return 1;
    }
    char *end;
    long long liczba = strtoll(argv[2], &end, 10);
    if ( *end != '\0' || end == argv[2]) {
        fprintf(stderr, "argument musi byc liczba\n");
        return 1;
    }

    if (strcmp(argv[1], "pn") == 0) {
        long long wynik = PrimeNumbers(liczba);
        if (wynik < 0) {
            fprintf(stderr, "brak pamieci\n");
            return 1;
        }
        printf("%lld\n", wynik);
    } else if (strcmp(argv[1], "pr") == 0) {
        if (liczba < 1) {
            fprintf(stderr, "n musi byc >= 1\n");
            return 1;
        }
        long long wynik = Prime(liczba);
        if (wynik < 0) {
            fprintf(stderr, "brak pamieci\n");
            return 1;
        }
        printf("%lld\n", wynik);
    } else {
        printf("%s\n", IsPrime(liczba) ? "True" : "False");
    }
    
    return 0;
}

// gcc -Wall -Wextra main.c prime.c -o program
// ./program komenda liczba