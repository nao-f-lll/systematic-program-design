;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname spinning-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; spinning-starter.rkt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                           ;
;                         PROBLEM:                          ;
;                                                           ;
;  Design a world program with the following features:       ;
;                                                           ;
;  - The world starts with a small square at the center of   ;
;    the screen.                                             ;
;  - As time progresses, the square stays fixed at the       ;
;    center but increases in size and rotates at a constant  ;
;    speed.                                                  ;
;  - Pressing the spacebar resets the square to its          ;
;    original size and rotation.                             ;
;                                                           ;
;  NOTE 1: Follow the How to Design Worlds (HtDW) recipe,    ;
;  ensuring proper domain analysis before coding.            ;
;                                                           ;
;  NOTE 2: To handle rotation, use the `rotate` function,    ;
;  which requires an angle in degrees between [0, 360). Use  ;
;  the `remainder` function to keep the angle within this    ;
;  range as time progresses.                                 ;
;                                                           ;
;  Example:                                                  ;
;    (rotate (remainder ... 360) (rectangle ...))            ;
;                                                           ;
;  NOTE 3: Even though a simpler solution exists without     ;
;  compound data, design your solution with compound data.   ;
;                                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; A square that rotate and increase in size

;; =================
;; Constants:

(define WIDTH 700)
(define HEIGHT 700)
(define CTR-Y (/ HEIGHT 2))
(define CTR-X (/ WIDTH 2))
(define MTS (empty-scene WIDTH HEIGHT))
(define COLOR "red")
(define GROWTH-SPEED 3)
(define ROTATIONAL-SPEED 15)

;; =================
;; Data definitions:

(define-struct cuadrado (size angle))
;; Cuadrado is (make-cuadrado Integer Integer)
;; interp. (make-cuadrado size angle) is a square with
;;          size is the size of the square
;;          angle is the rotation angle of the square

(define SQ1 (make-cuadrado 15 0))
(define SQ2 (make-cuadrado 50 359))
(define SQ3 (make-cuadrado 60 220))
#;
(define (fn-for-cuadrado sq)
  (... (cuadrado-size sq)   ;Integer
       (cuadrado-angle sq)));Integer

;; Template rules used:
;; - Compound: 2 fields

;; =================
;; Functions:

;; Cuadrado -> Cuadrado
;; start the world with (main (make-cuadrado 0 0))
;; 
(define (main ws)
  (big-bang ws                                    ; Cuadrado
            (on-tick   angle-size-square-handler) ; Cuadrado -> Cuadrado
            (to-draw   render-square)             ; Cuadrado -> Image
            (on-key    handle-key)))              ; Cuadrado KeyEvent -> Cuadrado

;; Cuadrado -> Cuadrado
;; produce the next square by increasing it's size and it's angle
(check-expect (angle-size-square-handler SQ1) (make-cuadrado (+ GROWTH-SPEED 15) (remainder(+ ROTATIONAL-SPEED 0) 360)))
(check-expect (angle-size-square-handler SQ2) (make-cuadrado (+ GROWTH-SPEED 50) (remainder (+ ROTATIONAL-SPEED 359) 360)))
;;(define (angle-size-square-handler sq) sq)
(define (angle-size-square-handler sq)
  (make-cuadrado (+ GROWTH-SPEED (cuadrado-size sq))
                 (remainder (+ ROTATIONAL-SPEED (cuadrado-angle sq)) 360)))

;; Cuadrado -> Image
;; render the give square at appropriate place in the MTS
(check-expect (render-square SQ1) (place-image
                                   (rotate 0 (square 15 "solid" COLOR))
                                   CTR-X
                                   CTR-Y
                                   MTS))

(check-expect (render-square SQ3) (place-image
                                   (rotate 220 (square 60 "solid" COLOR))
                                   CTR-X
                                   CTR-Y
                                   MTS))

;;(define (render-square sq) empty-image)
(define (render-square sq)
  (place-image
    (rotate (cuadrado-angle sq)
            (square(cuadrado-size sq) "solid" "red"))
     CTR-X
     CTR-Y
     MTS))

;; Cuadrado KeyEvent -> Cuadrado
;; reset the suare size and angle when the space bar is clicked
(check-expect (handle-key SQ1 " ") (make-cuadrado 0 0))
(check-expect (handle-key SQ2 "a") (make-cuadrado 50 359))

;;(define (handle-key sq ke) sq)


(define (handle-key sq ke)
  (cond [(key=? ke " ") (make-cuadrado 0 0)]
        [else 
         sq]))