(in-package :job-tasks)

#| Задание 1
Опишите выражение, представляющее собой последовательность вызовов
функций cdr и car, приводящую к получению атома X из списка:
(((A B) (()) (() () () (((X) C) D) E F)) (G H))
|#

; Решить задание в частном случае легко, вот ответ:
(defvar *task-1-list* '(((A B) (()) (() () () (((X) C) D) E F)) (G H)))
(car (car (car (car (cdr (cdr (cdr (car (cdr (cdr (car *task-1-list*)))))))))))

; Найдём общее решение: напишем функцию, которая принимает дерево cons-ячеек и объект, путь к которому нужно найти, после чего находит последовательность символов car и cdr, которая служит путём к искомому объекту.

(defun c*r-get (tree path)
  "The function takes a tree and a path to an element (the path is a list of car and cdr). Returns the element to which the path leads."
  (let ((res tree))
    (loop for f in path
          do (setf res (funcall f res)))
    res))


(defun c*r-search (tree elm)
  "The function takes a tree, the element to be found. Returns the path to this element in the tree (the path is a list of cards and cdrs). If the element is not found, returns the symbol :not-found."
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

(defun task-1 ()
  (c*r-search *task-1-list*
              'X))
