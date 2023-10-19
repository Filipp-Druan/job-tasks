(defsystem :job-tasks
    :version "1"
    :author "Filipp Druan"
    :license "MIT"
    :description "The tasks for Basealt"
    :depends-on (:paracute :alexandria)
    :components ((:file "package")
                 (:file "task-1.lisp")
                 ;(:file "task-2.lisp")
                 ;(:file "task-3.lisp")
                 (:file "tests"))) ; Обычно под тесты определяется отдельная система.
