(in-package job-tasks-tests)

#| Задание 3
Определите макрос для цикла do-range, реализующий итерационный
процесс через вызов функции с хвостовой рекурсией. Формат команды вызова
макроса:
(do-range (start-value end-value parameter) body)
где
start-value — начало диапазона;
end-value — конец диапазона;
parameter — идентификатор — параметр цикла;
body — тело цикла — одно или несколько выражений.
Тело цикла выполняется для каждого значения параметра в заданном диапазоне с шагом 1, если начальное значение меньше конечного, или с шагом −1, если конечное значение меньше начального.
|#

(defmacro do-range ((start-value end-value parameter) &body body)
  (let ((to-sym (if (numberp end-value)
                    (if (< end-value start-value)
                        :downto
                        :upto)
                    :upto)))
    `(loop :for ,parameter :from ,start-value ,to-sym ,end-value
           :do ,@body)))

(defun top-seq (n)
  (let ((mul 1))
    (do-range (2 n i)
      (setf mul (* mul (- (* 3 i)
                          4))))
    mul))

(defun bottom-seq (n)
  (let ((mul 1))
    (do-range (2 n i)
      (setf mul (* mul (* 3 i))))
    mul))

(defun S-n>3 (x n)
  (let ((sum (- x
                (* 2/6
                   (expt x 2)))))
    (do-range (3 n i)
      (ic:ic sum)
      (incf sum (* (expt -1 (1+ i))
                   (/ (top-seq i)
                      (bottom-seq i))
                   (expt x i))))
    sum))

(defun qbrt (n)
  (expt n (/ 1.0d0 3)))

(defun S-etalon (x)
  (- (* 3
        (qbrt (1+ x)))
     3))

(defun task-3 (x n) ; Не работает. Ряд расходится.
  (cond ((= n 1)
         x)

        ((= n 2)
         (- x
            (* 2/6
               (expt x 2))))

        ((> n 2)
         (S-n>3 x n))))
