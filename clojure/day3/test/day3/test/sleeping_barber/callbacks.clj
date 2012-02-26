(ns day3.test.sleeping-barber.callbacks
  (:use [day3.sleeping-barber.callbacks])
  (:use clojure.test midje.sweet))

(background (before :facts (open-shop)))

(fact "When the shop opens there's no-one waiting"
      (deref customers-waiting) => 0)

(fact "A new customer sits down if there are fewer than three customers waiting"
      (dorun (repeatedly 3 #(customer-arrives)))
      (deref customers-waiting) => 3)

(fact "A new customer leaves if there are already three customers waiting"
      (dorun (repeatedly 4 #(customer-arrives)))
      (deref customers-waiting) => 3)
