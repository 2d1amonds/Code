import math

def IsPrime(n):
    limit = math.isqrt(n)
    if n < 2:
        return False
    if n < 4:
        return True
    if n % 2 == 0:
        return False
    for d in range(3, limit + 1, 2):
        if n % d == 0:
            return False
    return True



def PrimeNumbers(n):
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



def _not_divisible(n, primes):
    for d in primes:
        if d * d > n:
            break
        if n % d == 0:
            return False
    return True


def Prime(n):
    if n < 1:
        raise ValueError("n musi byc >= 1")
    primes = [2]
    l = 3
    while len(primes) < n:
        if _not_divisible(l, primes):
            primes.append(l)
        l += 2
    return primes[-1]