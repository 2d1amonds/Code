with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure main is
    n : Integer;

    function isPrime (x : Integer) return Boolean is
    d : Integer := 3;
    begin
        if x < 2 then 
            return False;
        elsif x = 2 then
            return True;
        elsif x mod 2 = 0 then
            return False;
        end if;

        while d * d <= x loop
            if x mod d = 0 then
                return False;
            end if;
            d := d + 2;
        end loop;
        return True;
    end isPrime;
begin
    Put ("Enter an integer value n: ");
    Get (n);

    
    if n < 2 then
        Put_Line ("Podaj liczby dodatnie większe lub równe 2");
        return;
    end if;
    if isPrime(n) then
        Put_Line ("Liczba" & Integer'Image (n) & " jest pierwsza");
    else
        Put_Line ("Liczba" & Integer'Image (n) & " NIE jest pierwsza");
    end if;
end main;