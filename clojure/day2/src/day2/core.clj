(ns day2.core)

(defmacro unless [test body]
  (list 'if (list 'not test) body))
