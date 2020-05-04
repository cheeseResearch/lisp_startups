(in-package :startups.main)
;    ___                                  ___   _                            .
;  .'   \    ___  , _ , _     ___       .'   `. \ ___      .    ___    ___  _/_     ____
;  |        /   ` |' `|' `. .'   `      |     | |/   \     \  .'   ` .'   `  |     (
;  |    _  |    | |   |   | |----'      |     | |    `     |  |----' |       |     `--.
;   `.___| `.__/| /   '   / `.___,       `.__.' `___,' /`  |  `.___,  `._.'  \__/ \___.'
;                                                      \___/`

; Base objects
(defclass coin ()
    ((value :accessor coin-value
            :initarg :value
            :initform 1
            :type (integer 1)
            :documentation "The coin's value"))
    (:documentation "Currency used within the game"))

(defclass company ()
    ((name :accessor company-name
              :initarg :name
              :type string
              :documentation "The name of the company")
     (card-quantity  :accessor company-card-quantity
                :initarg :card-quantity
                :initform 0
                :type (integer 0)
                :documentation "The number of cards the company has")
     (token-owner :accessor company-token-owner
                  :type player
                  :documentation "Player who owns the monopoly token"))
    (:documentation "An entity within the game that some cards are associated with"))

(defclass card ()
    ((company :accessor card-company
              :initarg :company
              :type company
              :documentation "Company the card is associated with"))
    (:documentation "A token representing a stake within the company"))

(defclass player ()
    (
        (name :accessor player-name
              :initarg :name
              :type real
              :documentation "Name of the player")
        (hand :accessor player-hand
              :initform ())
        (investments :accessor player-investments)
        (capital :accessor player-capital
                 :initform 10
                 :type (integer 10)))
    (:documentation "A player within the game"))



; build the deck of cards
(defparameter deck ())

(defparameter companies ( list
    (make-instance 'company :name "Elepant Mars Travel"
                            :card-quantity 10)
    (make-instance 'company :name "HIPPO POWERTECH"
                            :card-quantity 9)
    (make-instance 'company :name "Octo Coffee"
                            :card-quantity 8)
    (make-instance 'company :name "Flamingo Soft"
                            :card-quantity 7)
    (make-instance 'company :name "Bowwow Games"
                            :card-quantity 6)
    (make-instance 'company :name "Giraffe Beer"
                            :card-quantity 5)
))



(setf *random-state* (make-random-state t))

(defvar outofplay ())

(defun removecard (card)
    "Remove the given card from the deck"
    (defparameter deck (remove card deck :count 1))
)
(defun drawcard ()
    "Draw a single card from the deck"
    (
        let ((drawncard (nth (random (length deck)) deck)))
        (removecard drawncard)
        (return-from drawcard drawncard)
    )
)

(defun setup-deck ()
    "Setup the deck for play"
    (loop for c in companies
        do (let ((basecard (make-instance 'card :company c)))
            (dotimes (n (company-card-quantity (card-company basecard))) 
                (defparameter deck (append deck (list basecard))))))
    (dotimes (n 5)
        (defparameter outofplay (append outofplay (list (drawcard)))))
)

(setup-deck)
