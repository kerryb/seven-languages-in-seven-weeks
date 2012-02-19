(ns day3.test.accounts
  (:use [day3.accounts])
  (:use clojure.test midje.sweet))

(fact "Accounts have balances"
      (def accounts (create_accounts [10, 20, 30]))
      (map deref accounts) => [10, 20, 30])

(fact "Accounts can be debited"
      (def accounts (create_accounts [10, 20, 30]))
      (debit (first accounts) 5)
      (map deref accounts) => [5, 20, 30])

(fact "Accounts can be credited"
      (def accounts (create_accounts [10, 20, 30]))
      (credit (nth accounts 1) 5)
      (map deref accounts) => [10, 25, 30])
