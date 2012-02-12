(ns day1.test.core
  (:use [day1.core])
  (:use clojure.test midje.sweet))

(fact
  (big "foo" 4) => false)
(fact
  (big "foo" 3) => false)
(fact
  (big "foo" 2) => true)

(fact
  (collection-type '(1 2 3)) => :list)
(fact
  (collection-type {1 2, 3 4}) => :map)
(fact
  (collection-type [1 2 3]) => :vector)
(fact
  (collection-type "not a collection") => :unknown)
