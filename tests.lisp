(in-package job-tasks-test)

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
