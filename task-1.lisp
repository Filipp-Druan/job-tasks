(in-package :job-tasks)

#| Задание 1
Опишите выражение, представляющее собой последовательность вызовов
функций cdr и car, приводящую к получению атома X из списка:
(((A B) (()) (() () () (((X) C) D) E F)) (G H))
|#

; Решить задание в частном случае легко, вот ответ:
(defvar *lst* '(((A B) (()) (() () () (((X) C) D) E F)) (G H)))
(car (car (car (car (cdr (cdr (cdr (car (cdr (cdr (car *lst*)))))))))))

; Найдём общее решение: напишем функцию, которая принимает дерево cons-ячеек и объект, путь к которому нужно найти, после чего находит последовательность символов car и cdr, которая служит путём к искомому объекту.



(defun c*r-search (tree elm)
    (cond ((eql tree elm)
           nil)

          ((consp tree)
           (let ((path))
               (setf path (c*r-search (car tree)
                                      elm))
               (if (eql path :not-found)
                   (setf path (c*r-search (cdr tree)
                                          elm))
                   (return-from c*r-search (cons 'car path)))

               (if (eql path :not-found)
                   (return-from c*r-search :not-found)
                   (return-from c*r-search (cons 'cdr path)))))
          (t
           :not-found)))
