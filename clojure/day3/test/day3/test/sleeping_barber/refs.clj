(ns day3.test.sleeping-barber.refs
  (:use [day3.sleeping-barber.refs])
  (:use clojure.test midje.sweet))

(background (before :facts (open-shop)))

(fact "When the shop opens there's no-one waiting"
      (deref customers-waiting) => 0)

(fact "Opening the shop initialises everything"
      (deref customers-waiting) => 0
      (deref shop-open) => true
      (deref barber-busy) => false)

(fact "Closing the shop updates the state"
      (close-shop)
      (deref shop-open) => false)

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
                          (deref customers-waiting) => 0)

                    (fact "Customers keep arriving until the shop shuts"
                          ; Should really test timings, but currently just
                          ; checks that it doesn't run forever
                          (start-customers-arriving)
                          (while (< (deref customers-waiting) 3) (Thread/sleep 1))
                          (close-shop)))

(fact "A new customer gets a haircut immediately if the barber isn't busy"
      (customer-arrives)
      (deref customers-waiting) => 0)

(fact "The barber serves a new customer when he finishes a haircut"
      (dorun (repeatedly 2 #(customer-arrives)))
      (while (> (deref customers-waiting) 0) (Thread/sleep 1)))

(fact "When the barber has no customers left he isn't busy"
      (dorun (repeatedly 2 #(customer-arrives)))
      (while (deref barber-busy) (Thread/sleep 1))
      (deref customers-waiting) => 0)

(fact "The number of haircuts given is recorded"
      (dorun (repeatedly 2 #(customer-arrives)))
      (while (> (deref customers-waiting) 0) (Thread/sleep 1))
      (deref haircuts-given) => 2)
