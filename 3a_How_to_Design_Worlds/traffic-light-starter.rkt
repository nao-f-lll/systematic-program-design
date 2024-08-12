;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname traffic-light-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; traffic-light-starter.rkt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                          ;
;                         PROBLEM:                         ;
;                                                          ;
;  Design an animation of a traffic light.                  ;
;                                                          ;
;  Your program should show a traffic light that cycles     ;
;  through red, green, yellow, and back to red, etc. The    ;
;  changing world state should be represented by an         ;
;  enumeration.                                             ;
;                                                          ;
;  If the initial world state is a red traffic light, your  ;
;  program might look like this:                            ;
;                                                          ;
;  To make the lights change at a reasonable speed, use the ;
;  `rate` option in `on-tick`. For example, `(on-tick       ;
;  next-color 1)` will make `big-bang` wait 1 second        ;
;  between calls to `next-color`.                           ;
;                                                          ;
;  Remember to follow the HtDW recipe! Do a proper domain   ;
;  analysis before starting to work on the code.            ;
;                                                          ;
;  Note: For a simpler version, you can modify the program  ;
;  to display a single circle that changes color, instead   ;
;  of three stacked circles.                                ;
;                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; A traffic light that cycles through red, green, yellow, and back to red

;; =================
;; Constants:
(define WIDTH 60)
(define HEIGHT 160)
(define MTS (empty-scene WIDTH HEIGHT "black"))
(define CIRCLE-RADIUS 25)
(define RED-CIRCLE (overlay (above
                            (circle CIRCLE-RADIUS "solid" "red")
                            (circle CIRCLE-RADIUS "outline" "yellow")
                            (circle CIRCLE-RADIUS "outline" "green"))
                            MTS))
(define YELLOW-CIRCLE (overlay (above
                            (circle CIRCLE-RADIUS "outline" "red")
                            (circle CIRCLE-RADIUS "solid" "yellow")
                            (circle CIRCLE-RADIUS "outline" "green"))
                            MTS))
(define GREEN-CIRCLE (overlay (above
                            (circle CIRCLE-RADIUS "outline" "red")
                            (circle CIRCLE-RADIUS "outline" "yellow")
                            (circle CIRCLE-RADIUS "solid" "green"))
                            MTS))

;; =================
;; Data definitions:

;; TrafficLight is one of:
;; - "red"
;; - "yellow"
;; - "green"
;; interp. the colors of a traffic light
;; <examples are rdundant for enumeration>

#;
(define (fn-for-traffic-light tl)
  (cond [(string=? tl "red") (...)]
        [(string=? tl "yellow") (...)]
        [(string=? tl "green") (...)]))

;; Template rules used:
;; - on of:
;;   - atomic distinct: "red"
;;   - atomic distinct: "yellow"
;;   - atomic distinct: "green"
;; =================
;; Functions:

;; TrafficLight -> TrafficLight
;; start the world with (main "red")
;; 
(define (main tl)
  (big-bang tl                        ; TrafficLight
            (on-tick advance-light 1) ; TrafficLight -> TrafficLight
            (to-draw render-light)))  ; TrafficLight -> Image

;; TrafficLight -> TrafficLight
;; produce the next TrafficLight is this order (red -> green -> yellow -> red)
(check-expect (advance-light "red") "green")
(check-expect (advance-light "green") "yellow")
(check-expect (advance-light "yellow") "red")

;;(define (advance-light tl) tl)

(define (advance-light tl)
  (cond [(string=? tl "red") "green"]
        [(string=? tl "yellow") "red"]
        [(string=? tl "green") "yellow"]))

;; TrafficLight -> Image
;; render the given TrafficLight
(check-expect (render-light "red") RED-CIRCLE)
(check-expect (render-light "yellow") YELLOW-CIRCLE)
(check-expect (render-light "green") GREEN-CIRCLE)

;;(define (render-light tl) empty-image)

(define (render-light tl)
  (cond [(string=? tl "red") RED-CIRCLE]
        [(string=? tl "yellow") YELLOW-CIRCLE]
        [(string=? tl "green") GREEN-CIRCLE]))
