;; ----------------------------------------------------------
;; SOLUTION 1: Conditional Summation (sumIf)
;; ----------------------------------------------------------

;; --- helper functions we pass as arguments ---

;; id: the identity function, returns its input unchanged
(= (id $x) $x)

;; isEven: True when $x is divisible by 2
(= (isEven $x)
   (if (== (% $x 2) 0) True False))

;; --- the higher-order function ---
;; Walk i from $a up to $b:
;;   - base case: when $a > $b, nothing left to add -> 0
;;   - if the condition holds for $a: add ($f $a) and continue
;;   - otherwise: skip $a and continue with [$a+1 .. $b]
(= (sumIf $f $condition $a $b)
   (if (> $a $b)
       0                                         ; base case: interval exhausted
       (let $rest (sumIf $f $condition (+ $a 1) $b)  ; sum of the rest of the interval
            (if ($condition $a)
                (+ ($f $a) $rest)                ; condition True  -> include f(a)
                $rest))))                        ; condition False -> skip a

;; --- test ---
;; Wrap in `unique` to collapse duplicate non-deterministic branches
;; down to the single distinct value.
!(unique (sumIf id isEven 1 5))   ; expected: 6  (2 + 4)
