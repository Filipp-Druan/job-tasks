(in-package job-tasks-tests)

(defun s-a (tree)
    (c*r-search tree 'A))

(define-test c*r-search
    (is equal
        '()
        (s-a 'A))
    
    (is equal
        :not-found
        (c*r-search '(B ((C) (A)))
                    'Q))
    
    (is equal
        '(car)
        (s-a '(A)))

    (is equal
        '(cdr car)
        (s-a '(B A)))

    (is equal
        '(cdr car cdr car car)
        (s-a '(B ((C) (A))))))

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

(define-test task-2
    (is equal
        '(c (a ((b) a) a) (a d (a) (b (b a (b) a z) h a a (b) a) a))
        (task-2 '(c (a ((b) a (b)) a) (a d (a) (b (b a (b) a z) a h a a (b) a)a))
                3
                3)))
