package body Wprimes is

   function Totient (n: Positive) return Positive is
      m: Positive := n;
      result: Positive := n;
      p: Positive := 2;
   begin
      while p <= m/p loop
         if m mod p = 0 then
            while m mod p = 0 loop
               m := m / p;
            end loop;
            result := result - (result / p);
         end if;
         P := p + 1;
      end loop;

      if m > 1 then
         result := result - (result / m);
      end if;

      return result;
   end Totient;

end Wprimes;