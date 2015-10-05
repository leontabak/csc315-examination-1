;; Eric Andow
;; This is a test added on October 5, 2015.

;; Questionable assert function for testing
(define (my-assert function inputs expectation)
  (if (equal? (apply function inputs) expectation)
      (display "Passed the test!")
      (display "Failed the test.")))

;; find the GCD of two numbers recursively
(define (my-gcd a b)
  (if (eq? b 0)
      a
      (my-gcd b (remainder a b))))

(display "GCD of 52 and 60 is 4")
(my-assert my-gcd '(52 60) 4)

;; Given two sorted lists of numbers,
;; produce a new sorted list that contains
;; all of the numbers.
(define (my-merge a b)
  (cond
    ((null? a) b)
    ((null? b) a)
    (else
     (let ((a-first (car a)) (b-first (car b)))
       (if (< a-first b-first)
           (cons a-first (my-merge (cdr a) b))
           (cons b-first (my-merge a (cdr b))))))))

(display "Merging '(2 3 7) and '(1 5 12) should produce
'(1 2 3 5 7 12).")
(my-assert my-merge '((2 3 7) (1 5 12)) '(1 2 3 5 7 12))

;; Get the n-th element of a list.
;; (index must be a positive integer that
;; is not greater than the number of elements
;; in some-list.
(define (get-element some-list index)
  (if (eq? index 1)
      (car some-list)
      (get-element (cdr some-list) (- index 1))))

(display "The 5th element of the list '(2 4 8 16 32 64) is 32.")
(my-assert get-element '((2 4 8 16 32 64) 5) 32)
