(in-package job-tasks-tests)

#| Задание 2
Опишите функцию трех аргументов l, n, m, где первый аргумент список, n
— номер уровня, m — номер позиции. Вызов (fn l n m) должен возвращать
список, полученный из l удалением элемента в позиции m в каждом подсписке
на уровне n.
Например, вызов
(fn '(c (a ((b) a (b)) a) (a d (a) (b (b a (b) a z) a h a a (b) a)a))
    3
    3)
должен возвратить
(c (a ((b) a) a) (a d (a) (b (b a (b) a z) h a a (b) a) a))

|#
; Мне не нравится, что номер позиции начинается с единицы. Я привык, что отсчёт идёт с единицы. Сделаем переменным!


(defun delete-from-pos (list pos &key (start-pos 0))
  "The function removes list element that are at a given position. You can specify from what number the counting of elements begins."
  (loop for i from start-pos
        for elm in list
        unless (= i pos)
          collect elm))

(defun delete-from-pos-on-level (list pos level &key (start-pos 0) (start-level 1))
  "The function removes elements that are in the pos position of the list at the nesting level level. You can specify from what numbers the counting of elements and levels begins."
  (if (= level start-level)
      (delete-from-pos list pos :start-pos start-pos)
      (loop for elm in list
            collect (if (listp elm)
                        (delete-from-pos-on-level elm
                                                  pos
                                                  (1- level)
                                                  :start-pos start-pos
                                                  :start-level start-level)
                        elm))))

(defun task-2 (list pos level)
  (delete-from-pos-on-level list
                            pos
                            level
                            :start-pos 1
                            :start-level 1))
