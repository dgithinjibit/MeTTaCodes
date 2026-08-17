;; ----------------------------------------------------------
;; SOLUTION 3: Digit Counter (count-digits)
;; ----------------------------------------------------------
;; Accumulator recursion on a single number.
;; Each step chops the last digit via integer division by 10
;; and bumps the running $count. Stop when the number hits 0.

;; Integer division by 10: remove the last digit first (subtract
;; the remainder), THEN divide, so the result stays a whole number.
(= (div10 $n)
   (/ (- $n (% $n 10)) 10))

(= (count-digits $number $count)
   (if (== $number 0)
       $count                                  ; base case: nothing left -> return tally
       (count-digits (div10 $number) (+ $count 1))))  ; chop a digit, count it

;; --- test ---
!(unique (count-digits 90721 0))   ; expected: 5
