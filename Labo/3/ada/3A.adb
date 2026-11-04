with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure N_Ta_Pierwsza is
   type Bool_Array is array (Natural range <>) of Boolean;

   function Nth_Prime (N : Positive) return Natural is
      Limit : Positive := 15;
   begin
      if N >= 6 then
         Limit := Integer (Float (N) * (Log (Float (N)) + Log (Log (Float (N))))) + 1;
      end if;

      declare
         S : Bool_Array (0 .. Limit) := (others => True);
         C : Natural := 0;
      begin
         S (0) := False;
         S (1) := False;
         for I in 2 .. Limit loop
            if S (I) then
               C := C + 1;
               if C = N then
                  return I;
               end if;
               for K in 2 .. Limit / I loop
                  S (K * I) := False;
               end loop;
            end if;
         end loop;
         return 0;
      end;
   end Nth_Prime;

   N : Integer;
begin
   Put ("Podaj liczbe calkowita n >= 1: ");
   Get (N);

   if N < 1 then
      Put_Line ("Blad: n musi byc >= 1.");
   else
      Put_Line (Integer'Image (N) & "-ta liczba pierwsza to"
                & Natural'Image (Nth_Prime (N)));
   end if;
end N_Ta_Pierwsza;