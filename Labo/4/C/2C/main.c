#include "totient.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "uzycie: ./program [liczba ... liczba]\n");
        return 1;
    }

    int ile = argc - 1;
    unsigned *liczby = malloc(ile * sizeof *liczby);
    if (!liczby) {
        fprintf(stderr, "brak pamieci\n");
        return 1;
    }

    for (int i = 0; i < ile; i++) {
        char *end;
        unsigned liczba = strtoll(argv[i + 1], &end, 10);
        if (end == argv[i + 1] || *end != '\0') {
            fprintf(stderr, "argument musi byc liczba\n");
            free(liczby);
            return 1;
        }
        if (liczba < 1) {
            fprintf(stderr, "liczba musi byc >= 1\n");
            free(liczby);
            return 1;
        }
        liczby[i] = liczba;
    }

    for (int i = 0; i < ile; i++) {
        printf("totient(%u) = %u\n", liczby[i], Totient(liczby[i]));
    }

    free(liczby);
    return 0;
}

// gcc -Wall -Wextra main.c totient.c -o program
// ./program [liczba ... liczba]