;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname movie-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; movie-starter.rkt

;; =================
;; Data definitions:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                          ;
;                         PROBLEM A:                       ;
;                                                          ;
;  Design a data definition to represent a movie, including ;
;  title, budget, and year released.                        ;
;                                                          ;
;  To help you create some examples, here are some          ;
;  interesting movie facts:                                 ;
;                                                          ;
;  "Titanic" - budget: 200000000 released: 1997             ;
;  "Avatar"  - budget: 237000000 released: 2009             ;
;  "The Avengers" - budget: 220000000 released: 2012        ;
;                                                          ;
;  Feel free to research more on your own!                  ;
;                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct movie (title budget releas))
;; Movie is (make-movie String Integer Integer)
;; interp. (make-movie title budget relaeas) is a movie with
;;          title is the title of the movie
;;          budget is the movie's budget
;;          release is the movie's releas date

(define MOVIE1 (make-movie "Titanic" 200000000 1997))
(define MOVIE2 (make-movie "Avatar" 237000000 2009))
(define MOVIE3 (make-movie "The Avengers" 220000000 2012))
#;
(define (fn-for-movie movie)
        (... (movie-title movie)    ;String
             (movie-budget movie)   ;Integer
             (movie-releas movie))) ;Integer
;; Template rules used:
;; Compound: 3 fields

;; =================
;; Functions:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                          ;
;                         PROBLEM B:                       ;
;                                                          ;
;  You have a list of movies you want to watch, but you     ;
;  prefer to watch your rentals in chronological order.     ;
;                                                          ;
;  Design a function that consumes two movies and produces  ;
;  the title of the most recently released movie.           ;
;                                                          ;
;  Note that when templating a function that consumes two   ;
;  compound data parameters, the template should include    ;
;  all the selectors for both parameters.                   ;
;                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Movie Movie -> String
;; given two movies, produce the title of the most recently released movie
(check-expect (recently-released MOVIE1 MOVIE2) "Avatar")
(check-expect (recently-released MOVIE2 MOVIE3) "The Avengers")
(check-expect (recently-released MOVIE3 MOVIE1) "The Avengers")

;;(define (recently-released movie1 movie2) "A")

(define (recently-released movie1 movie2)
        (if(> (movie-releas movie1) (movie-releas movie2))
            (movie-title movie1)
            (movie-title movie2)))


