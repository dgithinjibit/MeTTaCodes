;; ============================================================
;; CHALLENGE 10: The Grand Pipeline Solution
;; ============================================================

;; Predicate: is-odd
(= (is-odd $x)
   (== (% $x 2) 1))

;; Triple function
(= (triple $x)
   (* $x 3))

;; Filter function
(= (filter $pred ())
   ())
(= (filter $pred (cons $head $tail))
   (if ($pred $head)
       (cons $head (filter $pred $tail))
       (filter $pred $tail)))

;; Map function
(= (map $f ())
   ())
(= (map $f (cons $head $tail))
   (cons ($f $head) (map $f $tail)))

;; Fold function
(= (fold $combiner $acc ())
   $acc)
(= (fold $combiner $acc (cons $head $tail))
   (fold $combiner ($combiner $acc $head) $tail))

;; Test data
(= numbers (1 2 3 4 5 6 7 8 9 10))

;; THE GRAND PIPELINE: Filter odd, triple each, sum total
;; In one nested expression:
!(fold + 0 
   (map triple 
      (filter is-odd numbers)))

;; Step by step visualization:
;; Step 1: (filter is-odd (1 2 3 4 5 6 7 8 9 10)) -> (1 3 5 7 9)
;; Step 2: (map triple (1 3 5 7 9)) -> (3 9 15 21 27)
;; Step 3: (fold + 0 (3 9 15 21 27)) -> 75

;; Direct test
!(fold + 0 (map triple (filter is-odd (1 2 3 4 5 6 7 8 9 10))))
;; Expected: 75
