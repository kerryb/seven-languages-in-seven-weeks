(ns day3.test.accounts
  (:use [day3.accounts])
  (:use clojure.test midje.sweet))

(def accounts (create_accounts [10, 20, 30]))

(fact "Accounts contain balance references"
  (map deref accounts) => [10, 20, 30])
