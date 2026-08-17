;; ============================================================
;; CHALLENGE 8: The Range Guard Solution
;; ============================================================

;; Predicate: is-adult (age >= 18)
(= (is-adult $age)
   (>= $age 18))

;; Predicate: is-teen (13 <= age <= 19)
(= (is-teen $age)
   (and (>= $age 13) (<= $age 19)))

;; Filter function for lists
(= (filter $pred ())
   ())
(= (filter $pred (cons $head $tail))
   (if ($pred $head)
       (cons $head (filter $pred $tail))
       (filter $pred $tail)))

;; Test data: list of ages
(= ages (12 25 17 40 15 19 13 30))

;; TASK 1: Filter for adults only
!(filter is-adult ages)
;; Expected: (25 40 19 30)

;; TASK 2: Filter for teenagers only
!(filter is-teen ages)
;; Expected: (17 15 19 13)

;; Direct tests
!(filter is-adult (12 25 17 40))  ; Expected: (25 40)
!(filter is-teen (12 25 17 40))   ; Expected: (17)
