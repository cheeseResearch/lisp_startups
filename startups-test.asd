(defsystem startups-test
    :author "Sebastian Bartholomew"
    :depends-on (:startups
                 :fiveam)
    :components ((:module "tests"
                  :serial t
                  :components
                  ((:file "setup")
                   (:file "main")
                   (:file "final"))))
)