(ns day2.test.core
  (:use [day2.core])
  (:use clojure.test midje.sweet))

(defn foo ([] :bar))

(fact "unless when false returns nil"
      (unless true (foo)) => nil)

(fact "unless when false doesn't call the argument function"
      (unless true (foo)) => nil
      (provided
        (foo) => 42 :times 0))

(fact "unless when true returns result of calling second argument"
      (unless false (foo)) => 42
      (provided
        (foo) => 42))
