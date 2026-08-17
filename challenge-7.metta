;; ============================================================
;; CHALLENGE 7: The List Transformer Solution
;; ============================================================

;; Converter function: Celsius to Fahrenheit
;; Formula: F = (C * 9/5) + 32
(= (celsius-to-fahrenheit $celsius)
   (+ (* $celsius (/ 9 5)) 32))

;; Map function for lists
(= (map $f ())
   ())
(= (map $f (cons $head $tail))
   (cons ($f $head) (map $f $tail)))

;; Test data: temperatures in Celsius
(= celsius-temps (0 10 20 30 100))

;; Convert the list
!(map celsius-to-fahrenheit celsius-temps)
;; Expected: (32 50 68 86 212)

;; Alternative: using direct list syntax
!(map celsius-to-fahrenheit (0 10 20 30 100))
