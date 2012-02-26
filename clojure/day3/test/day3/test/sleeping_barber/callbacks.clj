(ns day3.test.sleeping-barber.callbacks
  (:use [day3.sleeping-barber.callbacks])
  (:use clojure.test midje.sweet))

(background (before :facts (open-shop)))

(fact "When the shop opens there's no-one waiting"
      (deref customers-waiting) => 0)

(against-background [(before :facts (dosync (ref-set barber-busy true)))]
                    (fact "A new customer sits down if there are fewer than three customers waiting"
                          (dorun (repeatedly 3 #(customer-arrives)))
                          (deref customers-waiting) => 3)

                    (fact "A new customer leaves if there are already three customers waiting"
                          (dorun (repeatedly 4 #(customer-arrives)))
                          (deref customers-waiting) => 3)

                    (fact "When the barber's ready he cuts the next customer's hair"
                          (customer-arrives)
                          (serve-customer)
                          (deref customers-waiting) => 0)

                    (fact "If there are no customers waiting when the barber's ready he does nothing"
                          (serve-customer)
                          (deref customers-waiting) => 0))

(fact "A new customer gets a haircut immediately if the barber isn't busy"
      (customer-arrives)
      (deref customers-waiting) => 0)

(fact "The barber serves a new customer when he finishes a haircut"
      (def start (System/currentTimeMillis))
      (dorun (repeatedly 2 #(customer-arrives)))
      (while (> (deref customers-waiting) 0) (Thread/sleep 1))
      (- (System/currentTimeMillis) start) => (roughly 20 5))

