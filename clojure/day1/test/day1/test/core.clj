(ns day1.test.core
  (:use [day1.core])
  (:use clojure.test midje.sweet))

(fact
  (big "foo" 4) => false)
(fact
  (big "foo" 3) => false)
(fact
  (big "foo" 2) => true)
