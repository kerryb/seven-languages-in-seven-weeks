(ns day2.test.core
  (:use [day2.core])
  (:use clojure.test midje.sweet))

(defn foo ([] :bar))

(fact "unless when false returns nil"
  (unless true (foo)) => nil)

(fact "unless when true returns result of second argument"
  (unless false (foo)) => :bar)
