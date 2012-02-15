(ns day1.test.big
  (:use [day1.big])
  (:use clojure.test midje.sweet))

(fact
  (big "foo" 4) => false)
(fact
  (big "foo" 3) => false)
(fact
  (big "foo" 2) => true)
