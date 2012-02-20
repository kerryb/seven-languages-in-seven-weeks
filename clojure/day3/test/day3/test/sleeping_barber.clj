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
