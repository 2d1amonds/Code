with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;

procedure N_Ta_Pierwsza is
   type Pos_Array is array (Positive range <>) of Positive;

   function isPrime ( N : Positive; S : Pos_Array) return Boolean is
   begin
      for D of S loop
         if D * D > N then
            return True;
         end if;
         if N mod D = 0 then
            return False;
         end if;
      end loop;
      return True;
   end isPrime;

   function NLiczbP (N : Natural) return Pos_Array is
      S   : Pos_Array (1 .. N);
      Ile : Natural := 0;
      L   : Positive := 3;
   begin
      if N = 0 then
         return S;
      end if;

      S (1) := 2;
      Ile := 1;
      while Ile < N loop
         if isPrime (L, S(1 .. Ile)) then
            Ile := Ile + 1;
            S (Ile) := L;
         end if;
         L := L + 2;
      end loop;
      return S;
   end NLiczbP;

   N : Integer;
begin
   Put ("Podaj liczbe n, aby wypisac n liczb pierwszych: ");
   Get (N);

   if N < 0 then
      Put_Line ("n musi byc >= 0");
      return;
   end if;

   declare
      Wynik : constant Pos_Array := NLiczbP (N);
   begin
      Put ("[");
      for I in Wynik'Range loop
         Put (Wynik (I), Width => 0);
         if I < Wynik'Last then
            Put (", ");
         end if;
      end loop;
      Put_Line ("]");
   end;
end N_Ta_Pierwsza;