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
