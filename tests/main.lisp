(in-package :startups-test)

(def-suite main)
(in-suite main)

(test setup-deck
    "Tests the deck setup function"
    (is (= 40 (length startups.main:deck))) ;; Deck should contain 40 cards
)