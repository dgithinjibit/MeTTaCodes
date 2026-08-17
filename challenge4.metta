;; CHALLENGE 4: Family Tree Knowledge Base Solution


;; Ground truth data
(Male Chandler)
(Female Monica)
(Male John)
(Female Pam)
(Parents (Monica Chandler) John)
(Parents (Monica Chandler) Pam)
(Parent John Bob)

;; GOAL 1: Get the Parents of John
;; Query: Who are John's parents?
!(match &self (Parents $parents John) $parents)

;; GOAL 2: Get the Mother of Pam
;; Query: Who is Pam's mother (female parent)?
!(match &self 
   (and (Parents ($mother $father) Pam)
        (Female $mother))
   $mother)

;; GOAL 3: Get the Siblings of Pam
;; Query: Who shares parents with Pam but is not Pam?
!(match &self
   (and (Parents $parents Pam)
        (Parents $parents $sibling)
        (!= $sibling Pam))
   $sibling)

;; GOAL 4: Get all Predecessors of Bob (Recursive)
;; Function to find ancestors recursively
(= (ancestors $person)
   (let $direct-parent (match &self (Parent $p $person) $p)
        (if (== $direct-parent ())
            (match &self (Parents $parents $person) $parents)
            (cons $direct-parent (ancestors $direct-parent)))))

!(ancestors Bob)
