(ns day1.collection-type)

(defmulti collection-type class)
(defmethod collection-type clojure.lang.IPersistentList [x] :list)
(defmethod collection-type clojure.lang.IPersistentMap [x] :map)
(defmethod collection-type clojure.lang.IPersistentVector [x] :vector)
(defmethod collection-type java.lang.Object [x] :unknown)
