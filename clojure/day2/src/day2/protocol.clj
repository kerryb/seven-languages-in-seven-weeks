(ns day2.protocol)

(defprotocol Greeter
  (greet [g, name]))

(defrecord Person [name]
  Greeter
  (greet [_, subject] (str "Hello " subject ", I am " name ".")))

(defrecord Dog [name]
  Greeter
  (greet [_, _] "Woof!"))

(defrecord Goldfish [name]
  Greeter
  (greet [_, _] ""))
