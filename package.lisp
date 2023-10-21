(defpackage :job-tasks
  (:use :cl :alexandria)
  (:export :c*r-search
                                        ; Task 2
           :delete-from-pos
           :delete-from-pos-on-level
           :task-2))

(defpackage :job-tasks-tests
  (:use :cl :parachute :job-tasks))
