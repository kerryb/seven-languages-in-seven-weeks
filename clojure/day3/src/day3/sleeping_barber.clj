(ns day3.sleeping-barber)

(defn runner [f time]
  (let [end (+ (System/currentTimeMillis) (* time 1000))]
  (while (< (System/currentTimeMillis) end) (f))))
