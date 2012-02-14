(ns day2.test.core
  (:use [day2.core])
  (:use clojure.test midje.sweet))

(fact "unless when false returns nil"
  (unless true :foo) => nil)

(fact "unless when true returns argument"
  (unless false :foo) => :foo)
