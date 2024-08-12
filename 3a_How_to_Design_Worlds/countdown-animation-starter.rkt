;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown-animation-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; countdown-animation starter.rkt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                          ;
;                         PROBLEM:                         ;
;                                                          ;
;  Design an animation of a simple countdown.               ;
;                                                          ;
;  Your program should display a countdown that starts at 10 ;
;  and decreases by one each clock tick until it reaches 0, ;
;  and then stays there.                                   ;
;                                                          ;
;  To make your countdown progress at a reasonable speed,   ;
;  you can use the `rate` option in `on-tick`. For example, ;
;  `(on-tick advance-countdown 1)` will make `big-bang`    ;
;  wait 1 second between calls to `advance-countdown`.     ;
;                                                          ;
;  Remember to follow the HtDW recipe! Do a proper domain  ;
;  analysis before starting to work on the code.           ;
;                                                          ;
;  Once the simple version is finished, improve it by       ;
;  resetting the countdown to 10 when you press the        ;
;  spacebar.                                               ;
;                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; A countdown program
;; =================
;; Constants:

(define WIDTH 100)
(define HEIGHT 100)
(define Y-COORD (/ HEIGHT 2))
(define X-COORD (/ WIDTH 2))
(define MTS (empty-scene WIDTH HEIGHT))
(define TEXT-SIZE 50)
(define TEXT-COLOR "black")

;; =================
;; Data definitions:

;; Countdown is Natural[0, 10]
;; interp. a countdown numbe
(define CT1 0)
(define CT2 5)
(define CT3 10)

#;
(define (fn-for-countdown cn)
  (... cn))

;; Template rule used:
;; - atomic non-distinct: Natural[1, 10]




;; =================
;; Functions:

;; Countdown -> Countdown
;; start the world with (main 10)
;; 
(define (main c)
  (big-bang c 
             (on-tick   advance-countdown 1) ; Countdown -> Countdown
             (to-draw   render-countdown)    ; Countdown -> Image
             (on-key    handle-key)))        ; Countdown KeyEvent -> Countdown

;; Countdown -> Countdown
;; advances the countdown by subtracting 1, if the countdown is zero it remains at zero
(check-expect (advance-countdown 0) 0)
(check-expect (advance-countdown 5) 4)
(check-expect (advance-countdown 10) 9)


;;(define (advance-countdown cn) cn)

;; <use template from Countdown>
(define (advance-countdown cn)
  (if (= cn 0)
      0
      (- cn 1)))

;; Countdown -> Image
;; render the given countdown in the MTS
(check-expect (render-countdown 0) (place-image (text "0" TEXT-SIZE TEXT-COLOR) X-COORD Y-COORD MTS))
(check-expect (render-countdown 5) (place-image (text "5" TEXT-SIZE TEXT-COLOR) X-COORD Y-COORD MTS))
(check-expect (render-countdown 10) (place-image (text "10" TEXT-SIZE TEXT-COLOR) X-COORD Y-COORD MTS))

;;(define (render-countdown cn) empty-image)

;; <use template from Countdown>
(define (render-countdown cn)
  (place-image (text (number->string cn) TEXT-SIZE TEXT-COLOR)
               X-COORD
               Y-COORD
               MTS))

;; Countdown KeyEvent -> Countdown
;; reset the countdown to 10 when the space key is clicked
(check-expect (handle-key 0 " ")  10)
(check-expect (handle-key 10 " ") 10)
(check-expect (handle-key 0 "a")   0)
(check-expect (handle-key 10 "a") 10)

;;(define (handle-key c ke) 0)

(define (handle-key c ke)
  (cond [(key=? ke " ") 10]
        [else c]))