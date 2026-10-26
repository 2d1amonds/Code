def czynnikiPierwsze(n: int):
    res = []
    d = 2
    while d * d < n:
        if n % d == 0:
            n //= d
            res.append(d)
        else:
            d += 1
    if n > 1:
        res.append(n)

    num_dict = {}
    for i in range(len(res)):
        if res[i] not in num_dict:
            num_dict[res[i]] = 1
        else:
            num_dict[res[i]] += 1

    return dictToText(num_dict, n)

def dictToText(num_dict: dict, n : int):
    parts = []
    for p, e in num_dict.items():
        if e > 1:
            parts.append(f"{p}^{e}")
        else:
            parts.append(f"{p}")
    left = " * ".join(parts)
    return f"{left} = {n}"

def main():
    n = int(input("Podaj liczbę: "))
    print(f"Dzielniki liczby {n} to {czynnikiPierwsze(n)}")

main()