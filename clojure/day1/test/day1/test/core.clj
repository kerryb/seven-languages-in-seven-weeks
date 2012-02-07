(ns day1.test.core
  (:use [day1.core])
  (:use clojure.test midje.sweet))

(fact
  (big "foo" 2) => false)
