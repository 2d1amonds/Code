with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;


package body Primes is

   function PrimeNumbers (n : Positive) return Positive is
      type Sieve is array (2 .. n) of Boolean;    
      s : Sieve := (others => True);
      count : Natural := 0;
   begin
      for i in s'Range loop
         if s (i) then
            count := count + 1;                    
            if i <= n / i then                     
               declare
                  j : Positive := i * i;
               begin
                  while j <= n loop
                     s (j) := False;
                     j := j + i;
                  end loop;
               end;
            end if;
         end if;
      end loop;
      return Positive (count);
   end PrimeNumbers;

   function Prime(n : Positive) return Positive is
      count : Natural := 0;
      l : Positive := 3;
   begin 
      while count < n loop
         l := l + 1;
         if IsPrime(l) then
            count := count + 1;
         end if;
      end loop;
      return l;
   end Prime;

   function IsPrime (n : Positive) return Boolean is
      d : Natural := 3;
   begin
      if n < 2 then
         return False;
      end if;
      if n < 4 then
         return True;
      end if;
      if n mod 2 = 0 then
         return False;
      end if;

      while d <= n/d loop
         if n mod d = 0 then
            return False;
         end if;
         d := d + 2;
      end loop;
      return True;
   end IsPrime;

end Primes;