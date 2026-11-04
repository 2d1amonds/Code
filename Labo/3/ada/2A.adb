with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Dwumian is
   type Row_Array is array (Natural range <>) of Long_Long_Integer;

   function Newton (N, K : Integer) return Long_Long_Integer is
      Kk  : constant Integer := Integer'Min (K, N - K);
      Row : Row_Array (0 .. Kk) := (others => 0);
   begin
      Row (0) := 1;
      for I in 1 .. N loop
         for J in reverse 1 .. Integer'Min (I, Kk) loop
            Row (J) := Row (J) + Row (J - 1);
         end loop;
      end loop;
      return Row (Kk);
   end Newton;

   N, K : Integer;
begin
   Put ("Podaj liczbe n (n >= 0): ");
   Get (N);
   Put ("Podaj liczbe k (0 <= k <= n): ");
   Get (K);

   if N < 0 or K < 0 or K > N then
      Put_Line ("Blad: wymagane 0 <= k <= n.");
   else
      Put_Line ("Wynik:" & Long_Long_Integer'Image (Newton (N, K)));
   end if;
end Dwumian;