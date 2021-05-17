(defsystem "cl-dollar"
  :description "Collection of handy packages for CL REPL"
  :author "Will Foran <will.foran@gmail.com>"
  :license  "GPLv3"
  :version "0.0.1"
  :serial t
  :class :package-inferred-system
  :components ((:file "cl-dollar"))
  :depends-on ("cmd" "serapeum" "alexandria" "cl-interpol" ))
