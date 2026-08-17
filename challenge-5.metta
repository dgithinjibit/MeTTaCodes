;; CHALLENGE 5: Python Interoperability Solution

;; TASK 1: The Mathematician - Calculate 2^10 using math.pow
!(bind! &math (py-atom math))
!(py-dot &math pow 2 10)  ; Expected: 1024

;; TASK 2: Real-World OS Inquiry - Get CPU count
!(bind! &os (py-atom os))
!(py-dot &os cpu_count)   ; Returns number of CPUs

;; TASK 3: Data Cleaning - Remove duplicates from MeTTa space
;; First, add some data with duplicates
(Item Apple)
(Item Banana)
(Item Apple)
(Item Orange)
(Item Banana)

;; Function to get unique items using Python set
(= (get-unique-items)
   (let $all-items (match &self (Item $x) $x)
        (let $py-list (py-list $all-items)
             (let $unique-set (py-dot (py-atom set) __init__ $py-list)
                  (py-dot $unique-set __iter__)))))

;; Alternative: Query and process in MeTTa
(= (unique-items $acc)
   (let $items (match &self (Item $x) $x)
        (filter-unique $items ())))

(= (filter-unique () $result) $result)
(= (filter-unique (cons $h $t) $result)
   (if (member $h $result)
       (filter-unique $t $result)
       (filter-unique $t (cons $h $result))))

(= (member $x ()) False)
(= (member $x (cons $h $t))
   (if (== $x $h) True (member $x $t)))

!(unique-items ())  ; Returns unique items
