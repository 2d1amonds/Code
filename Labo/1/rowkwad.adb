

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
        Put ("Dzialanie nie ma rozwiazania w zbiorze R");
    end if;
end rowKwad;
