def convert(number: int, top: int):
    for i in range(2, top):
        base = i
        n = number
        res = []
        while n != 0:
            new_base = 1
            count = 0
            while new_base * base <= n:
                new_base *= base
                count += 1
            for j in range(base - 1, 0, -1):
                if new_base * j <= n:
                    res.append([j, count])
                    n -= new_base * j
                    break
        print(base, res)


convert(295766, 17)