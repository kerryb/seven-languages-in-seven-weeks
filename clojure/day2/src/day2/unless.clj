(ns day2.unless)

(defmacro unless [test f1 & f2]
  (list 'if (list 'not test) f1 (first f2)))
