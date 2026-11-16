

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
