;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname compound-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; compound-starter.rkt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                          ;
;                         PROBLEM:                         ;
;                                                          ;
;  Design a data definition to represent hockey players,    ;
;  including both their first and last names.               ;
;                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct player (name surname))
;; Player is (make-player String String)
;; interp. (make-player name surname) is a hockey player with
;;          name is the first name
;;          surname is the last name

(define PLAYER (make-player "John" "Smith"))

#;
(define (fn-for-player p)
  (... (player-name p)      ;String
       (player-surname p))) ;String

;; Template rules used:
;; - Compound: 2 fields
