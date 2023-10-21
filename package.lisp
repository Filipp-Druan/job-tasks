(defpackage :job-tasks
  (:use :cl :ic :alexandria)
  (:export ; Task 1
           :c*r-search
           :c*r-get
           :*task-1-list*
           :x
           :task-1
           ; Task 2
           :delete-from-pos
           :delete-from-pos-on-level
           :task-2))

(defpackage :job-tasks-tests
  (:use :cl :parachute :job-tasks))
