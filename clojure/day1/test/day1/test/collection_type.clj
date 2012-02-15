(ns day1.test.collection-type
  (:use [day1.collection-type])
  (:use clojure.test midje.sweet))

(fact
  (collection-type '(1 2 3)) => :list)
(fact
  (collection-type {1 2, 3 4}) => :map)
(fact
  (collection-type [1 2 3]) => :vector)
(fact
  (collection-type "not a collection") => :unknown)
