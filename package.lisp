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
           :task-2
           ; Task 3
           :do-range
           :S-etalon
           :task-3))

(defpackage :job-tasks-tests
  (:use :cl :parachute :job-tasks))
