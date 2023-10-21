(defsystem :job-tasks
  :version "1"
  :author "Filipp Druan"
  :license "MIT"
  :description "The tasks for Basealt"
  :depends-on (:parachute :alexandria :cl-ic)
  :components ((:file "package")
               (:file "task-1")
               (:file "task-2")
               (:file "task-3")
               (:file "tests"))) ; Обычно под тесты определяется отдельная система.
