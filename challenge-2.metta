;; ----------------------------------------------------------
;; SOLUTION 2: The General Accumulator (accumulate)
;; ----------------------------------------------------------
;; Generalizes sumIf: the "how to combine" (+ or *) and the
;; "empty value" (0 or 1) are now PARAMETERS, not hard-coded.

;; id: identity, used as the transform when we want each term as-is
(= (id $x) $x)

;; accumulate:
;;   base case: interval exhausted ($a > $b) -> return $baseCase
;;   step:      ($combiner (f a) rest-of-interval)
(= (accumulate $combiner $baseCase $f $a $b)
   (if (> $a $b)
       $baseCase                                   ; neutral value (0 for +, 1 for *)
       (let $rest (accumulate $combiner $baseCase $f (+ $a 1) $b)
            ($combiner ($f $a) $rest))))           ; call the combiner function

;; --- tests ---
!(unique (accumulate + 0 id 1 4))   ; expected: 10   (1+2+3+4)
!(unique (accumulate * 1 id 1 4))   ; expected: 24   (1*2*3*4  -> factorial of 4!)
