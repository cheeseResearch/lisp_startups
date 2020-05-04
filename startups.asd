(defsystem startups
    :author "Sebastian Bartholomew"
    :maintainer "Sebastian Bartholomew"
    :version "0.1"
    :depends-on ()
    :components ((:module "src"
                  :serial t
                  :components
                  (   (:file "packages")
                      (:file "main"))))
    :description "An implementation of the game Startups"
    :in-order-to ((test-op (test-op startups-test))))