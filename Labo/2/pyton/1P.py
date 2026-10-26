def euklidesMod(a: int, b: int):
    a, b = abs(a), abs(b)
    while a and b:
        if a > b:
            a %= b
        else:
            b %= a
    return a or b

def main():
    a = int(input("Podaj liczbę a: "))
    b = int(input("Podaj liczbę b: "))
    print(f"NWD {a} i {b} = {euklidesMod(a, b)}")

main()