(ns day3.sleeping-barber)

(defn runner [f time]
  (let [end (+ (System/currentTimeMillis) (* time 1000))]
    (while (< (System/currentTimeMillis) end) (f))))

(defn new-waiting-room [number-of-chairs]
  (java.util.concurrent.LinkedBlockingQueue. number-of-chairs))

(defn customer-arrives [q]
  (.offer q :a-customer))

(defn serve-customer [q]
  (.take q))
