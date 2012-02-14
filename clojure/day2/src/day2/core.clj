(ns day2.core)

(defmacro unless [test f1 & f2]
  (list 'if (list 'not test) f1))
