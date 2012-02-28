;; Implementation using refs. This is completely separate from the version
;; using a blocking queue.
(ns day3.sleeping-barber.refs)

(def haircuts-given (ref 0))
(def customers-waiting (ref 0))
(def shop-open (ref false))
(def barber-busy (ref false))

(defn open-shop []
  (dosync
    (ref-set haircuts-given 0)
    (ref-set customers-waiting 0)
    (ref-set shop-open true)
    (ref-set barber-busy false)))

(defn close-shop []
  (dosync
    (ref-set shop-open false)))

(defn serve-customer []
  (dosync
    (if (> (deref customers-waiting) 0)
      (do
        (ref-set barber-busy true)
        (alter customers-waiting - 1)
        (alter haircuts-given + 1)
        (future (Thread/sleep 20) (serve-customer)))
      (ref-set barber-busy false))))

(defn customer-arrives []
  (dosync
    (if (< (deref customers-waiting) 3)
      (alter customers-waiting + 1))
    (if (not (deref barber-busy))
      (serve-customer))))

(defn customer-gap []
  (+ 10 (rand-int 20)))

(defn start-customers-arriving []
  (future
    (Thread/sleep (customer-gap))
    (customer-arrives)
    (if (deref shop-open) (start-customers-arriving))))

;; Run (load "day3/sleeping_barber/refs") (day3.sleeping-barber.refs/run) in
;; REPL to simulate ten seconds' worth of haircuts
(defn run []
  (let [end (+ (System/currentTimeMillis) 10000)]
    (open-shop)
    (start-customers-arriving)
    (while (< (System/currentTimeMillis) end) (Thread/sleep 1)))
  (close-shop)
  (deref haircuts-given))
