(ns day3.test.sleeping-barber
  (:use [day3.sleeping-barber])
  (:use clojure.test midje.sweet))

(fact "Runner runs for the specified number of seconds"
      (defn f [] (Thread/sleep 5))
      (def start (System/currentTimeMillis))
      (runner f 1)
      (- (System/currentTimeMillis) start) => (roughly 1000 10))

(fact "Runner repeatedly calls the supplied function"
      (defn f [] nil)
      (runner f 1) => nil
      (provided
        (f) => 0 :times (> 1)))

(fact "A customer arriving when there's a free chair sits down"
      (def waiting-room (new-waiting-room 3))
      (customer-arrives waiting-room)
      (alength (.toArray waiting-room)) => 1)

(fact "A customer arriving when there's no free chair leaves"
      (def waiting-room (new-waiting-room 3))
      (dorun (repeatedly 4 #(customer-arrives waiting-room)))
      (alength (.toArray waiting-room)) => 3)

(fact "Serving a customer removes them from the queue"
      (def waiting-room (new-waiting-room 3))
      (customer-arrives waiting-room)
      (serve-customer waiting-room)
      (alength (.toArray waiting-room)) => 0)

(fact "If there are no customers, the barber waits"
      (def waiting-room (new-waiting-room 3))
      (def start (System/currentTimeMillis))
      (future ((Thread/sleep 100) (customer-arrives waiting-room)))
      (serve-customer waiting-room)
      (- (System/currentTimeMillis) start) => (roughly 100 10))
