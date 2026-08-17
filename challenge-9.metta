;; ============================================================
;; CHALLENGE 9: The Totalizer Solution
;; ============================================================

;; Fold function (left fold)
(= (fold $combiner $acc ())
   $acc)
(= (fold $combiner $acc (cons $head $tail))
   (fold $combiner ($combiner $acc $head) $tail))

;; Maximum combiner function
(= (max-combiner $a $b)
   (if (> $a $b) $a $b))

;; Test data: shopping cart prices
(= cart-prices (10.5 5.0 25.99 8.75))

;; TASK 1: Calculate total of all prices
!(fold + 0 cart-prices)
;; Expected: 50.24

;; TASK 2: Find maximum price
!(fold max-combiner 0 cart-prices)
;; Expected: 25.99

;; Direct tests
!(fold + 0 (10.5 5.0 25.99))           ; Expected: 41.49
!(fold max-combiner 0 (10.5 5.0 25.99)) ; Expected: 25.99

;; Alternative: using multiplication for product
!(fold * 1 (2 3 4))  ; Expected: 24
