;; Implementation using refs. This is completely separate from the version
;; using a blocking queue.
(ns day3.sleeping-barber.refs)

(def customers-waiting (ref 0))
(def shop-open (ref false))
(def barber-busy (ref false))

(defn open-shop []
  (dosync
    (ref-set customers-waiting 0)
    (ref-set shop-open true)
    (ref-set barber-busy false)))

(defn close-shop []
  (dosync
    (ref-set shop-open false)))

(defn serve-customer []
  (dosync
    (if (> (deref customers-waiting) 0)
      (do (ref-set barber-busy true)
      (alter customers-waiting - 1)
      (future (Thread/sleep 20) (serve-customer))))))

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
