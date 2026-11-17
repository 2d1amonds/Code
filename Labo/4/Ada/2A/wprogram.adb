with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Command_Line;  use Ada.Command_Line;
with Ada.Strings;       use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Wprimes;

procedure Wprogram is

   function Text (x : Natural) return String is
   begin
      return Trim (Natural'Image (x), Left);
   end Text;

   function Correct (s: String) return Boolean is
      x : Natural;
   begin
      x := Natural'Value (s);
      return x >= 1;
   exception
      when Constraint_Error =>
         return False;
   end Correct;

begin
   if Argument_Count < 1 then
      Put_Line (Standard_Error, "uzycie: ./program liczba [liczba ... liczba]");
      Set_Exit_Status (Failure);
   end if;

   for i in 1 .. Argument_Count loop
      if not Correct (Argument (i)) then
         Put_Line (Standard_Error, "argument nie jest >= 1");
         Set_Exit_Status (Failure);
      end if;
   end loop;

   for i in 1 .. Argument_Count loop 
      declare
         n : constant Natural := Natural'Value (Argument (i));
      begin
         Put_Line ("totient(" & Text (n) & ") = " & Text (Wprimes.Totient(n)));
      end;
   end loop;
end Wprogram;