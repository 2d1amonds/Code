import math


def nth_prime(n):
    def upper_bound(n):
        if n < 6:
            return 15                  
        return int(n * (math.log(n) + math.log(math.log(n)))) + 1

    def create_sieve(s, limit):
        for _ in range(limit + 1):
            s.append(True)
        s[0] = False
        s[1] = False

    def compute_sieve(s):
        for i in range(2, len(s)):
            if s[i]:
                j = i * i               
                while j < len(s):
                    s[j] = False
                    j = j + i

    def find_nth(s, n):
        c = 0
        for i in range(len(s)):
            if s[i]:
                c = c + 1
                if c == n:
                    return i

    s = []
    create_sieve(s, upper_bound(n))
    compute_sieve(s)
    return find_nth(s, n)


def read_n():
    while True:
        text = input("Podaj liczbe calkowita n >= 1: ")
        try:
            n = int(text)
        except ValueError:
            print("Blad: to nie jest liczba calkowita. Sprobuj ponownie.")
            continue
        if n < 1:
            print("Blad: n musi byc >= 1. Sprobuj ponownie.")
            continue
        return n


def main():
    n = read_n()
    print(f"{n}-ta liczba pierwsza to {nth_prime(n)}")


main()