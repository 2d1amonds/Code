

procedure isPalindrome is
    p : Integer;
    n : Integer;
    reversed_num : Integer;
    number : Integer;
begin
    Put ("Enter an integer value p (base): ");
    Get (p);
    
    if p < 2 then
        Put_Line ("Podstawa musi byc >= 2");
        return;
    end if;

    Put ("Enter an integer value n (number): ");
    Get (n);

    reversed_num := 0;
    number := n;
    
    while number /= 0 loop
        reversed_num := reversed_num * p + number mod p;
        number := number / p;
    end loop;
    if n = reversed_num then
        Put_Line ("True");
    else
        Put_Line ("False");
    end if;
end isPalindrome;