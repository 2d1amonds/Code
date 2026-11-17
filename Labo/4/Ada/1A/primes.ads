package Primes is
   function Prime (n : Positive) return Positive;
   function PrimeNumbers (n : Positive) return Positive
     with Pre => n >= 2;
   function IsPrime (n : Positive) return Boolean;
end Primes;