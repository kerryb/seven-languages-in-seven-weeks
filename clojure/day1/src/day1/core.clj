(ns day1.core)

(defn big
  ([st n] (> (count st) n)))

(defmulti collection-type class)
(defmethod collection-type clojure.lang.IPersistentList [x] :list)
(defmethod collection-type clojure.lang.IPersistentMap [x] :map)
(defmethod collection-type clojure.lang.IPersistentVector [x] :vector)
(defmethod collection-type java.lang.Object [x] :unknown)
