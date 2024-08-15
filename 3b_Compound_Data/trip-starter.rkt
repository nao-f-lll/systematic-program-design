;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname trip-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; trip-starter.rkt

;; =================
;; Data definitions:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                   ;
;                          PROBLEM A:                               ;
;                                                                   ;
;  Design a data definition to represent a trip, which includes:     ;
;  - origin:        the starting location of the trip (String)       ;
;  - destination:   the ending location of the trip (String)         ;
;  - mode of transport: the means of transportation (String)         ;
;  - duration:      the duration of the trip in days (Number)        ;
;                                                                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct trip (origin destination transportation duration))
;; Trip is (make-trip String String String Natural)
;; interp. (make-trip origin destination transportation duration) is a trip width
;;         origin is the origin of the trip
;;         destination is the destination of the trip
;;         transportation is the node of trasnport used in the trip
;;         duration is the duration of the trip in days 

(define TRIP1 (make-trip "Santa Monica" "Olimpia" "car" 6))
(define TRIP2 (make-trip "Port Elizabith" "Durban" "bus" 1))
(define TRIP3 (make-trip "Liverpool" "New York" "ship" 12))
(define TRIP4 (make-trip "Londone" "Auckland" "plane" 2))

(define (fn-for-trip trip)
  (... (trip-origin trip)           ; String
       (trip-destination trip)      ; String
       (trip-transportation trip)   ; String
       (trip-duration trip)))       ; String

;; Template rules used:
;; - Compound: 4 cases

;; =================
;; Functions:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                   ;
;                         PROBLEM B:                                ;
;                                                                   ;
;  You have just found out that you have to use all your days off    ;
;  work on your next vacation before they expire at the end of the   ;
;  year. Comparing two options for a trip, you want to take the one  ;
;  that lasts the longest. Design a function that compares two trips ;
;  and returns the trip with the longest duration.                   ;
;                                                                   ;
;  Note that the rule for templating a function that consumes two    ;
;  compound data parameters is for the template to include all       ;
;  the selectors for both parameters.                                ;
;                                                                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Trip Trip -> Trip
;; given two trips return the one with longest duration
(check-expect (the-longest-trip TRIP1 TRIP2) TRIP1)
(check-expect (the-longest-trip TRIP4 TRIP3) TRIP3)

;;(define (the-longest-trip trip1 trip2) trip1)

(define (the-longest-trip trip1 trip2)
  (if (> (trip-duration trip1) (trip-duration trip2)) 
       trip1
       trip2)) 