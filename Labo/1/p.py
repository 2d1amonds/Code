import math

def euklides(a: int, b: int):
    while a != b:
        if a > b:
            a -= b
        else:
            b -= a
    return a

def euklidesMod(a: int, b: int):
    while a and b:
        if a > b:
            a %= b
        else:
            b %= a
    return a or b

def rowKwad():
    print("Podaj a")
    a = float(input())

    print("Podaj b")
    b = float(input())

    print("Podaj c")
    c = float(input())

    delta = (b**2) - (4 * a * c)
    if a == 0:
        return "a musi byc rozne od 0"
    if delta > 0:
        p = math.sqrt(delta)
        x1 = (-b + p) / (2*a)
        x2 = (-b - p) / (2*a)
        return x1, x2
    if delta == 0:
        x0 = -b / (2*a)
        return x0
    if delta < 0:
        return "Działanie nie ma rozwiazanie w zbiorze R"

def isPalindrome(n: int, p: int):
    reversed_num = 0
    number = n
    while number!= 0:
        reversed_num = reversed_num * p + number % p
        number //= p
    print(n == reversed_num)

wynik = rowKwad()
print(wynik)