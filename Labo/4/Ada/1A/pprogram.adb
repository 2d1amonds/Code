with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Command_Line;  use Ada.Command_Line;
with Ada.Strings;       use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Primes;

procedure Pprogram is

   function Text (x : Natural) return String is
   begin 
      return Trim (Natural'Image (x), Left);
   end Text;

   function Correct (s: String) return Boolean is
      x : Natural;
   begin 
      x := Natural'Value (s);
      return x >= 0;
   exception
   when Constraint_Error =>
      return False;
   end Correct;

begin
   if Argument_Count /= 2 then
      Put_Line (Standard_Error, "uzycie: ./pprogram {pr|pn|ip} liczba");
      Set_Exit_Status (Failure);
      return;
   end if;

   declare
      Cmd : constant String := Argument (1);
   begin
      if Cmd /= "pn" and Cmd /= "pr" and Cmd /= "ip" then
         Put_Line (Standard_Error, "uzycie: ./pprogram {pn|pr|ip} liczba");
         Set_Exit_Status (Failure);
         return;
      end if;

      if not Correct (Argument (2)) then
         Put_Line (Standard_Error, "argument musi byc >= 0");
         Set_Exit_Status (Failure);
         return;
      end if;

      declare
         n : constant Natural := Natural'Value (Argument (2));
      begin
         if Cmd = "pn" then
            if n < 2 then
               Put_Line (Standard_Error, "n musi byc >= 2");
               Set_Exit_Status (Failure);
               return;
            end if;
            Put_Line (Text (Primes.PrimeNumbers (n)));
         elsif Cmd = "pr" then
            if n < 1 then
               Put_Line (Standard_Error, "n musi byc >= 1");
               Set_Exit_Status (Failure);
               return;
            end if;
            Put_Line (Text (Primes.Prime (n)));
         else
            if Primes.IsPrime (n) then
               Put_Line ("True");
            else
               Put_Line ("False");
            end if;
         end if;
      end;
   end;
end Pprogram;