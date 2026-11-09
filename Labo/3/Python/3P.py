import math

def nliczbP(n: int):
    if n < 1:
        return []
    s = [2]
    l = 3
    i = 2
    while i<= n:
        if isPrime(l, s):
            s.append(l)
            i += 1
        l += 2
    return s

def isPrime(n: int, s: list[int]):
    for d in s:
        if d > math.isqrt(n):
            break
        if n % d == 0:
            return False
        return True

def main():
    n = int(input("Podaj liczbe n, aby wypisac n liczb pierwszych: "))
    if n < 0:
        print("n musi byc >= 0")
        return
    print(nliczbP(n))

main()