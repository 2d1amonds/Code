def newton(n: int, k: int):
    if k > n - k:
        k = n - k

    row = [0] * (k + 1)
    row[0] = 1

    for i in range(1, n + 1):
        for j in range(min(i,k), 0, -1):
            row[j] = row[j] + row[j - 1]
    return row[k]

def main():
    n = int(input("Podaj liczbe n >= 0: "))
    k = int(input("Podaj liczbe k >= 0 i <= n: "))
    if n < 0:
        print("n musi byc >= 0")
    elif k < 0 or k > n:
        print("k musi byc >= 0 i <= n")


    print(f"Dwumian Newtona C({n}, {k}) = {newton(n, k)}")

main()