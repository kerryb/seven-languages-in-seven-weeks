(ns day3.sleeping-barber)

(defn new-waiting-room [number-of-chairs]
  (java.util.concurrent.LinkedBlockingQueue. number-of-chairs))

(def haircut-count (ref 0))

(defn customer-arrives [q]
  (.offer q :a-customer))

(defn serve-customer [q]
  (.take q))

(defn cut-hair [q]
  (serve-customer q)
  (dosync (alter haircut-count + 1))
  (Thread/sleep 20)
  (cut-hair q))

(defn start-cutting-hair [q]
  (future (cut-hair q)))

(defn customer-gap []
  (+ 10 (rand-int 20)))

(defn customer-stream [q]
  (Thread/sleep (customer-gap))
  (customer-arrives q)
  (customer-stream q))

(defn start-customers-arriving [q]
  (future (customer-stream q)))

(defn haircuts-given []
  (deref haircut-count))

;; Run (load "day3/sleeping_barber") (day3.sleeping-barber/run) in REPL to
;; simulate ten seconds' worth of haircuts
(defn run []
  (let [end (+ (System/currentTimeMillis) 10000)
        waiting-room (new-waiting-room 3)
        barber (start-cutting-hair waiting-room)
        customers (start-customers-arriving waiting-room)]
    (while (< (System/currentTimeMillis) end) (Thread/sleep 1))
    (future-cancel customers)
    (future-cancel barber))
  (haircuts-given))
