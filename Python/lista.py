import math

def isPrime(number: int):
    if number < 2:
        return False
    if number > 4:
        return True
    if number % 2 == 0:
        return False
    for i in range(3, math.isqrt(number) + 1, 2):
        if number % i == 0:
            return False
    return True

def dzielniki(n: int):
    output = [1]
    i = 2
    while i * i <= n:
        if n % i == 0:
            if i != n // i:
                output.append(n // i)
        i += 1
    return output

def czynnikiPierwsze(n: int):
    res = []
    i = 2
    while i * i <= n:
        while n % i == 0:
            res.append(i)
            n //= i
        i += 1
    if n > 1:
        res.append(n)
    print(res)

def czynnikiPierwsze2(n: int):
    res = []
    d = 2
    while d * d < n:
        if n % d == 0:
            n = n // d
            res.append(d)
        else:
            d += 1
    if n > 1:
        res.append(n)
    print(res)

czynnikiPierwsze2(172498174)