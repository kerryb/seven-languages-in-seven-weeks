;; Implementation using callbacks. This is completely separate from the version
;; using a blocking queue.
(ns day3.sleeping-barber.callbacks)

(def customers-waiting (ref 0))

(defn customer-arrives []
  (dosync (alter customers-waiting + 1)))

;; Run (load "day3/sleeping_barber/callbacks")
;; (day3.sleeping-barber.callbacks/run) in REPL to simulate ten seconds' worth
;; of haircuts
(defn run [])
