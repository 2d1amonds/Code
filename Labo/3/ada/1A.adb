with Ada . Text_IO ; use Ada . Text_IO ;
with Ada . Integer_Text_IO ; use Ada . Integer_Text_IO ;
procedure PrimeNumbers is
    function PrimeNumbers ( n : Natural ) return Natural is
        type Sieve is array (2 .. n ) of Boolean ;

        procedure ComputeSieve ( s : in out Sieve ) is
            j : Natural ;
        begin
            for i in s ’ Range loop
                s ( i ) := True ;
            end loop ;
            for i in s ’ First .. s ’ Last loop
                if s ( i ) then
                    j := i + i ;
                    while j <= n loop
                        s ( j ) := False ;
                        j := j + i ;
                    end loop ;
                end if ;
            end loop ;
        end ComputeSieve ;
        function CountPrimes ( s : Sieve ) return Natural is
            c : Natural := 0;
        begin
            for i in s ’ First .. s ’ Last loop
                if s ( i ) then
                    c := c + 1;
                end if ;
            end loop ;
            return c ;
        end CountPrimes ;

        s : Sieve ;
    begin
        ComputeSieve ( s );
        return CountPrimes ( s );
    end PrimeNumbers ;

   n : Natural ;
begin
   Put ("Podaj liczbe calkowita n >= 2: ");
   Get (N);

   if N < 2 then
      Put_Line ("Blad: n musi byc >= 2.");
   else
      Put_Line ("Liczba liczb pierwszych nie wiekszych od" & Integer'Image (N)
                & ":" & Natural'Image (Prime_Numbers (N)));
   end if;
end Sito;