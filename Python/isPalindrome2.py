def isPalindrome(number: int, base: int) -> bool:
    original = number
    reversed_num = 0
    n = number
    while n!= 0:
        digit = n % base
        reversed_num = reversed_num * base + digit
        n //= base
    print(original == reversed_num)

isPalindrome(43962, 16)