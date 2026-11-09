import math

def primenumbers(n):
    def create_sieve(s, n):
        for _ in range(n+1):
            s.append(True)
        s[0] = False
        s[1] = False
        
    def compute_sieve(s):
        for i in range(2, math.isqrt(len(s))):
            if s[i]:
                j = i * i
                while j < len(s):
                    s[j] = False
                    j += i

    def count_primes(s):
        c = 0
        for e in s:
            if e:
                c += 1
        return c

    s = []
    create_sieve(s, n)
    compute_sieve(s)
    return count_primes(s)

def read_n():
    text = input("Podaj liczbe całkowitą n >= 2: ")
    try:
        n = int(text)
    except ValueError:
        print("to nie jest liczba calkowita, sprobuj ponownie.")
    if n < 2:
        print("n musi byc >= 2, sprobuj ponownie.")
    return n

def main():
    n = read_n()
    print(primenumbers(n))

main()