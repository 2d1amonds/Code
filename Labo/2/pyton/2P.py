import math

def isPrime(n: int):
    n = abs(n)
    if n < 2:
        return False
    if n == 2:
        return True
    if n % 2 == 0:
        return False

    for i in range(3, math.isqrt(n) + 1, 2):
        if n % i == 0:
            return False
    return True


def main():
    n = int(input("Podaj liczbę: "))
    if isPrime(n):
        print(f"Liczba {n} jest liczba pierwszą")
    else:
        print(f"Liczba {n} NIE jest liczba pierwszą")

main()