(ns day2.test.core
  (:use [day2.core])
  (:use clojure.test midje.sweet))

(defn foo ([] :foo))
(defn bar ([] :bar))

(fact "unless/2 when true returns nil"
      (unless true (foo)) => nil)

(fact "unless/2 when true doesn't call the first function"
      (unless true (foo)) => nil
      (provided
        (foo) => 42 :times 0))

(fact "unless/2 when false returns result of calling the first function"
      (unless false (foo)) => 42
      (provided
        (foo) => 42))


(fact "unless/3 when false returns result of calling the first function"
      (unless false (foo) (bar)) => 42
      (provided
        (foo) => 42))

(fact "unless/3 when false doesn't call the second function"
      (unless false (foo) (bar)) => 42
      (provided
        (foo) => 42
        (bar) => 1 :times 0))
