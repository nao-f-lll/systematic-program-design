;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname growing-grass-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; growing-grass-starter.rkt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                              ;
;                         PROBLEM:                             ;
;                                                              ;
;                                                              ; 
; Design a world program as follows:                           ;
;                                                              ;
; The world starts off with a piece of grass waiting to grow.  ;
; As time passes,                                              ;
; the grass grows upwards. Pressing any key cuts the current   ;
; strand of                                                    ;
; grass to 0, allowing a new piece to grow to the right of it. ;
;                                                              ;
; NOTE 1: Remember to follow the HtDW recipe! Be sure to do    ;
; a proper domain                                              ;
; analysis before starting to work on the code file.           ;
;                                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;  a grass that grows upwards, pressing any key cut it and create new one to the right.

;; =================
;; Constants:

(define WIDTH 600)
(define HEIGHT 400)
(define MTS (empty-scene WIDTH HEIGHT))
(define GROWT-SPEED 3)
(define GRASS-COLOR "light green")
(define GRASS-WIDTH 10)
(define MOVE-TO-RIGHT-SPEED 5)

;; =================
;; Data definitions:

(define-struct grass (height xposition))
;; Grass is (make-grass Natural Natural)
;; interp. (make-grass height xposition) is a grass width
;;          height is the height of the grass
;;          xposition is the x coordinate of the grass in the MTS

(define GRASS1 (make-grass 0 0))
(define GRASS2 (make-grass 100 (/ WIDTH 2)))

#;
(define (fn-for-grass grass)
  (... (grass-height grass)      ;Natural
       (grass-xposition grass))) ;Natural

;; Template rules used:
;; Compound: 2 cases
  
;; =================
;; Functions:

;; Grass -> Grass
;; start the world with (main (make-grass 0 5))
;; 
(define (main grass)
  (big-bang grass                      ; Grass
            (on-tick   advance-grass)  ; Grass -> Grass
            (to-draw   render-grass)   ; Grass -> Image
            (on-key    handle-key)))   ; Grass KeyEvent -> Grass

;; Grass -> Grass
;; increment the height of the grass by GROWT-SPEED
(check-expect (advance-grass GRASS1) (make-grass (+ GROWT-SPEED 0) 0))
(check-expect (advance-grass GRASS2) (make-grass (+ GROWT-SPEED 100) (/ WIDTH 2)))

;;(define (advance-grass grass) grass)
(define (advance-grass grass)
  (make-grass (+ GROWT-SPEED (grass-height grass))
       (grass-xposition grass)))

;; Grass -> Image
;; render the given grass at appropriate position in the MTS
(check-expect (render-grass GRASS1) (place-image
                                    (rectangle GRASS-WIDTH 0 "solid" GRASS-COLOR)
                                     0 HEIGHT MTS))

(check-expect (render-grass GRASS2) (place-image
                                    (rectangle GRASS-WIDTH 100 "solid" GRASS-COLOR)
                                    (/ WIDTH 2) HEIGHT MTS))

;;(define (render-grass grass) empty-image)
(define (render-grass grass)
  (place-image
       (rectangle GRASS-WIDTH (grass-height grass) "solid" GRASS-COLOR)
       (grass-xposition grass)
       HEIGHT
       MTS))


;; Grass KeyEvent -> Grass
;; pressing any key remove the grass and advance it's xposition by MOVE-TO-RIGHT-SPEED 
(check-expect (handle-key GRASS1 " ") (make-grass 0 (+ MOVE-TO-RIGHT-SPEED 0)))
(check-expect (handle-key GRASS2 "a") (make-grass 0 (+ MOVE-TO-RIGHT-SPEED (/ WIDTH 2))))

;;(define (handle-key grass ke) grass)

(define (handle-key grass ke)
           (make-grass 0 (+ MOVE-TO-RIGHT-SPEED (grass-xposition grass))))
