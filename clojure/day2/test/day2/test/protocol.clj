(ns day2.test.protocol
  (:use [day2.protocol])
  (:import (day2.protocol Person Dog Goldfish))
  (:use clojure.test midje.sweet))

(fact "A person greets you by name"
      (greet (Person. "Bob") "Kerry") => "Hello Kerry, I am Bob.")

(fact "A dog greets you by barking"
      (greet (Dog. "Rover") "Kerry") => "Woof!")

(fact "A goldfish doesn't greet you at all"
      (greet (Goldfish. "Bubbles") "Kerry") => "")
