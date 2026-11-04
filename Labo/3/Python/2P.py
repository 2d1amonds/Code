def newton(n: int, k: int):
    if k > n - k:
        k = n - k

    row = [0] * (k + 1)
    row[0] = 1

    for i in range(1, n + 1):
        for j in range(min(i,k), 0, -1):
            row[j] = row[j] + row[j - 1]
    return row[k]

def read_int(prompt):
    while True:
        try:
            return int(input(prompt))
        except ValueError:
            print("Blad: to nie jest liczba calkowita. Sprobuj ponownie.")


def main():
    while True:
        n = read_int("Podaj liczbe n (n >= 0): ")
        k = read_int("Podaj liczbe k (0 <= k <= n): ")
        if n < 0:
            print("Blad: n musi byc >= 0. Sprobuj ponownie.")
        elif k < 0 or k > n:
            print("Blad: k musi spelniac 0 <= k <= n. Sprobuj ponownie.")
        else:
            break

    print(f"Dwumian Newtona C({n}, {k}) = {newton(n, k)}")

main()