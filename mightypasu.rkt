#lang racket

(require web-server/servlet
         web-server/servlet-env
         web-server/http
         racket/random)

;; List of English proverbs
(define proverbs
  (list
   "A stitch in time saves nine."
   "Actions speak louder than words."
   "Better late than never."
   "Don't count your chickens before they hatch."
   "Every cloud has a silver lining."
   "Honesty is the best policy."
   "Look before you leap."
   "Practice makes perfect."
   "The early bird catches the worm."
   "When in Rome, do as the Romans do."))

;; Function to pick a random proverb
(define (random-proverb)
  (list-ref proverbs (random (length proverbs))))

;; The main servlet handler
(define (start request)
  (response/xexpr
   `(html
     (head
      (title "English Proverbs"))
     (body
      (h1 "English Proverbs")
      (p ,(random-proverb))
      (form ([method "post"] [action "/"])
            (button ([type "submit"]) "Get another proverb"))))))

;; Start the servlet
(serve/servlet start
               #:servlet-path "/"
               #:port 8000
               #:launch-browser? #t)