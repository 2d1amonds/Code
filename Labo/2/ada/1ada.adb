with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure euklides is
    a : Integer;
    b : Integer;

    function NWD (x, y : Integer) return Integer is
    p : Integer := x;
    q : Integer := y;
    begin
        while p /= q loop
            if p > q then
                p := p - q;
            else
                q := q - p;
            end if;
        end loop;
        return p;
    end NWD;
begin
    Put ("Enter an integer value a: ");
    Get (a);

    Put ("Enter an integer value b: ");
    Get (b);
    
    if a <= 0 or b <= 0 then
        Put_Line ("Podaj liczby dodatnie");
        return;
    end if;
    Put_Line ("NWD" & Integer'Image (a) & " i" & Integer'Image (b)
        & " =" & Integer'Image (NWD (a, b)));
end euklides;