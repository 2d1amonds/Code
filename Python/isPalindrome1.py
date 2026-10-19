def convert(number: int, base: int):
    if base < 2:
        print("Base is smaller than 2")
        return
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

    number_list = []
    existing = {power: digit for digit, power in res}        
    for power in range(res[0][1], -1, -1):
        number_list.append([existing.get(power, 0), power])

    full = ""
    for i in range(len(number_list)):
        if number_list[i][0] >= 10:
            number_str = chr(ord("A") + number_list[i][0] - 10)
            full = full + number_str
        else:
            number_str = str(number_list[i][0])
            full = full + number_str

    print(full)
    print(isPalindrome(full))

def isPalindrome(number: int):
    j = len(number) - 1
    for i in range(len(number) // 2):
        if number[i] != number[j]:
            return False
        j -= 1
    return True

convert(1409278, 16)