import math

def addition():
    print("Write the 1st number you want to add: ")
    a = input()
    print("Write the 2nd number: ")
    b = input()
    c = int(a) + int(b)
    print("The addition of", a ,"+", b ,"is equal to ", c)

def all():
    print("Write the 1st number: ")
    a = int(input())
    print("Write the 2nd number: ")
    b = int(input())
    
    print(a + b, a - b, a * b, a / b, math.sqrt(a + b))

def unknown():
    print("Write the 1st number: ")
    a = int(input())
    print("Write the 2nd number: ")
    b = int(input())
    print("Write the type of operation(+, -, *, /, **, sqrt): ")
    c = input()

    if c == "+":
        print(a + b)
    if c == "-":
        print(a - b)
    if c == "*":
        print(a * b)
    if c == "/":
        print(a / b)
    if c == "**":
        print(a ** b)
    if c == "sqrt":
        print(math.sqrt(a + b))

def when100():
    print("What's your name?")
    name = input()
    print("What's your age?")
    age = int(input())
    date = 2026 + (100 - age)
    print(name, "you are going to turn 100 years old in", date)

def idk():
    print("Podaj współrzędna x: ")
    x = int(input())
    print("Podaj współrzędna y: ")
    y = int(input())
    r = math.sqrt(x**2 + y**2)
    asin = math.asin(y/r)
    print(r, asin)