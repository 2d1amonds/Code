with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure main is
    n:Integer;

    function rozkladCzPierwsze(x : Integer) is
        first: Boolean := True;
        e: Integer;
        p: Integer := 2;
        m: integer := x;
    begin
        Put (x, Width => 1);
        Put ("=");

        while p * p < m loop
            if m mod p = 0 then
                e := 0;
                while m mod p = 0 loop
                    m := m / p;
                    e := e + 1;
                end loop;

                if not first then
                    Put ("*");
                end if;
                Put (p, Width => 1);
                if e > 1 then
                    Put ("^");
                    Put (e, Width => 1);
                end if;
                first := False;
            end if;
            p := p + 1;
        end loop;

        if m > 1 then
            if not first then
                Put ("*");
            end if;
            Put (m, Width => 1)
        end if;
        New_Line;
    end rozkladCzPierwsze;
begin
    Put ("Enter an integer value n: ");
    Get (n);

    if n < 2 then
        Put_Line ("Podaj liczbe calkowita >= 2");
        return;
    end if;

    PrintFactorization (n);
end main

