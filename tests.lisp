(in-package job-tasks-tests)

(define-test c*r-search
    (is equal
        '(car)
        (c*r-search '(A)
                    'A))

    (is equal
        '(car cdr)
        (c*r-search '(B A)
                    'A))

    (is equal
        '(car car cdr car cdr)
        (c*r-search '(B ((C) (A)))
                    'A)))


(defun dfp (list pos)
    (delete-from-pos list pos))

(defun dfp-1 (list pos)
    (delete-from-pos list pos :start-pos 1))

(define-test delete-from-pos
    (is equal
        '(1 2 3 4 5)
        (dfp '(1 2 3 4 5)
             1234))
    
    (is equal
        '(2 3 4 5)
        (dfp '(1 2 3 4 5)
             0))

    (is equal
        '(1 3 4 5)
        (dfp '(1 2 3 4 5)
             1))

    (is equal
        '(1 3 4 5)
        (dfp-1 '(1 2 3 4 5)
               2))

    (is equal
        '(2 3 4 5)
        (dfp-1 '(1 2 3 4 5)
               1)))

(define-test test-2
    (is equal
        '(c (a ((b) a) a) (a d (a) (b (b a (b) a z) h a a (b) a) a))
        (foo '(c (a ((b) a (b)) a) (a d (a) (b (b a (b) a z) a h a a (b) a)a))
             3
             3)))
