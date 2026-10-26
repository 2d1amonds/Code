with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure euklides is
    a : Integer;
    b : Integer;
begin
    Put ("Enter an integer value a: ");
    Get (a);

    Put ("Enter an integer value b: ");
    Get (b);
    
    if a <= 0 or b <= 0 then
        Put_Line ("Podaj liczby dodatnie");
        return;
    end if;
    
    while a /= b loop
        if a > b then
            a := a - b;
        else
            b := b - a;
        end if;
    end loop;
    Put (a, Width => 0);
end euklides;


procedure euklidesMod is
    a : Integer;
    b : Integer;
begin
    Put ("Enter an integer value a: ");
    Get (a);

    Put ("Enter an integer value b: ");
    Get (b);
    
    if a <= 0 or b <= 0 then
        Put_Line ("Podaj liczby dodatnie");
        return;
    end if;
    while a /= 0 and b /= 0 loop
        if a > b then
            a := a mod b;
        else
            b := b mod a;
        end if;
    end loop;
    if a = 0 then
        Put (b, Width => 0);
    else
        Put (a, Width => 0);
    end if;
end euklidesMod;


procedure rowKwad is
    a : Float;
    b : Float;
    c : Float;
    delt : Float;
    p : Float;
    x0 : Float;
    x1 : Float;
    x2 : Float;
begin
    Put ("Enter an integer value a: ");
    Get (a);

    Put ("Enter an integer value b: ");
    Get (b);
    
    Put ("Enter an integer value c: ");
    Get (c);
    
    if a = 0.0 then
        Put_Line ("a nie moze byc rowne 0");
        return;
    end if;
    
    delt := (b*b) - (4.0*a*c);
    
    if delt > 0.0 then
        p := Sqrt (delt);
        x1 := (-b + p) / (2.0*a);
        x2 := (-b - p) / (2.0*a);
        Put (x1, Fore => 1, Aft => 4, Exp => 0); New_Line;
        Put (x2, Fore => 1, Aft => 4, Exp => 0); New_Line;
    elsif delt = 0.0 then
        x0 := -b / (2.0*a);
        Put (x0, Fore => 1, Aft => 4, Exp => 0); New_Line;
    else 
        Put ("Działanie nie ma rozwiazania w zbiorze R");
    end if;
end rowKwad;


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