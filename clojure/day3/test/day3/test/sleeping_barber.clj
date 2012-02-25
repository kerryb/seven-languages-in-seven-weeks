(ns day3.test.sleeping-barber
  (:use [day3.sleeping-barber])
  (:use clojure.test midje.sweet))

(background (before :facts (def waiting-room (new-waiting-room 3))))

(fact "A customer arriving when there's a free chair sits down"
      (customer-arrives waiting-room)
      (alength (.toArray waiting-room)) => 1)

(fact "A customer arriving when there's no free chair leaves"
      (dorun (repeatedly 4 #(customer-arrives waiting-room)))
      (alength (.toArray waiting-room)) => 3)

(fact "Serving a customer removes them from the queue"
      (customer-arrives waiting-room)
      (serve-customer waiting-room)
      (alength (.toArray waiting-room)) => 0)

(fact "The barber keeps count of how many customers he's served"
      (dorun (repeatedly 3 #(customer-arrives waiting-room)))
      (def barber (start-cutting-hair waiting-room))
      (while (not (.isEmpty waiting-room)) (Thread/sleep 1))
      (future-cancel barber)
      (haircuts-given) => 3)

(fact "If there are no customers, the barber waits"
      (def start (System/currentTimeMillis))
      (def customer (future ((Thread/sleep 200) (customer-arrives waiting-room))))
      (serve-customer waiting-room)
      (future-cancel customer)
      (- (System/currentTimeMillis) start) => (roughly 200 40))

(fact "The barber serves a customer every 20ms"
      (def start (System/currentTimeMillis))
      (dorun (repeatedly 3 #(customer-arrives waiting-room)))
      (def barber (start-cutting-hair waiting-room))
      (while (not (.isEmpty waiting-room)) (Thread/sleep 1))
      (future-cancel barber)
      (- (System/currentTimeMillis) start) => (roughly 40 10)) ; Time doesn't include last customer

(fact "A customer arrives every 10-30ms"
      (def start (System/currentTimeMillis))
      (def customers (start-customers-arriving waiting-room))
      (while (< (alength (.toArray waiting-room)) 3) (Thread/sleep 1))
      (future-cancel customers)
      (- (System/currentTimeMillis) start) => (roughly 60 10)
      (provided
        (customer-gap) =streams=> [20 10 30] :times anything))
