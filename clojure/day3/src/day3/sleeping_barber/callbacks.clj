;; Implementation using callbacks. This is completely separate from the version
;; using a blocking queue.
(ns day3.sleeping-barber.callbacks)

(def customers-waiting (ref 0))
(def barber-busy (ref false))

(defn open-shop []
  (dosync
    (ref-set customers-waiting 0)
    (ref-set barber-busy false)))

(defn serve-customer []
  (if (> (deref customers-waiting) 0)
    (dosync
      (ref-set barber-busy true)
      (alter customers-waiting - 1))
    (future (Thread/sleep 20) (serve-customer))))

(defn customer-arrives []
  (dosync
    (if (< (deref customers-waiting) 3)
      (alter customers-waiting + 1))
    (if (not (deref barber-busy))
      (serve-customer))))
