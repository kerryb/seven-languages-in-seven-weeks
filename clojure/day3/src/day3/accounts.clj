(ns day3.accounts)

(defn create_accounts [balances]
  (map ref balances))

(defn debit [account amount]
  (dosync (alter account - amount)))

(defn credit [account amount]
  (dosync (alter account + amount)))

(defn transfer [source_account destination_account amount]
  (dosync (alter source_account - amount) (alter destination_account + amount)))
