;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDDDesignQuiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; HtDD Design Quiz

;; Age is Natural
;; interp. the age of a person in years
(define A0 18)
(define A1 25)

#;
(define (fn-for-age a)
  (... a))

;; Template rules used:
;; - atomic non-distinct: Natural


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                          ;
;                       Problem 1:                         ;
;                                                          ;
;  Consider the above data definition for the age of a     ;
;  person.                                                 ;
;                                                          ;
;  Design a function called teenager? that determines      ;
;  whether a person of a particular age is a teenager      ;
;  (i.e., between the ages of 13 and 19).                  ;
;                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; Age -> Boolean
;; produce true if the age is of a teenager (between 13 and 19)
(check-expect (teenager? 12) false)
(check-expect (teenager? 13) true)
(check-expect (teenager? 19) true)
(check-expect (teenager? 20) false)

;;(define (teenager? age) true)

;; <use template from Age>

(define (teenager? age)
  (and (>= age 13) (<= age 19)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                          ;
;                      Problem 2:                          ;
;                                                          ;
;  Design a data definition called MonthAge to represent    ;
;  a person's age in months.                               ;
;                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; MonthAge is Natural
;; interp. the age of a person in months
(define MA1 12)
(define MA2 288)
#;
(define (fn-for-month-age ma)
  (... ma))

;; Template rule used
;; - atomic non-distinct: Natural

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                          ;
;                      Problem 3:                          ;
;                                                          ;
;  Design a function called months-old that takes a         ;
;  person's age in years and yields that person's age in    ;
;  months.                                                  ;
;                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Age -> MonthAge
;; give an age in years convert it to months 
(check-expect (months-old 1) 12)
(check-expect (months-old 15) (* 15 12))

;;(define (months-old age) 12)

;; <use template from MonthAge>

(define (months-old age)
  (* age 12))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                          ;
;                      Problem 4:                          ;
;                                                          ;
;  Consider a video game where you need to represent the    ;
;  health of your character. The only thing that matters    ;
;  about their health is:                                   ;
;                                                          ;
;   - if they are dead (which is shockingly poor health)    ;
;   - if they are alive then they can have 0 or more        ;
;     extra lives                                           ;
;                                                          ;
;  Design a data definition called Health to represent      ;
;  the health of your character.                            ;
;                                                          ;
;  Design a function called increase-health that allows     ;
;  you to increase the lives of a character. The function   ;
;  should only increase the lives of the character if the   ;
;  character is not dead, otherwise the character remains   ;
;  dead.                                                    ;
;                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Health is one of:
;; -  Natural
;; - "dead"
;; interp.
;;  - deade means that the player is dead
;;  - Natural means the plates is alive and how many extar lives he have

(define HEALTH1 "dead")
(define HEALTH2 0)
(define HEALTH3 5)

#;
(define (fn-for-health ht)
  (cond [(number? ht) (... ht)]
        [else (...)]))

;; Template rules used:
;; - one of: 2 cases
;;   - atomic non-distinct: Natural
;;   - atomic distinct: "dead"

;; Function

;; Health -> Health
;; increase the number of lives if the player is alive
(check-expect (increase-health "dead") "dead")
(check-expect (increase-health 0) 1)

;;(define (increase-health ht) ht)

;; <use template from Health>

(define (increase-health ht)
  (cond [(number? ht) (+ ht 1)]
        [else ht]))