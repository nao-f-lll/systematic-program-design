;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tracker-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                                           ;
;                             PROBLEM:                                      ;
;                                                                           ;
;  Design a world program that displays the current (x, y) position          ;
;  of the mouse at that current position. So as the mouse moves, the         ;
;  numbers in the (x, y) display change and the position of the display      ;
;  changes accordingly.                                                     ;
;                                                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; display the current (x, y) position of the mouse

;; =================
;; Constants:

(define WIDTH 400)
(define HEIGHT 400)
(define MTS (empty-scene WIDTH HEIGHT))
(define TEXT-SIZE 15)
(define TEXT-COLOR "red")
(define WHITE-SPACE (square 10 "outline" "white"))

;; =================
;; Data definitions:
(define-struct mouse (x y))
;; Mouse is (make-mouse Integer Integer)
;; interp. (make-mouse x y) is a mouse width
;;    x is the x coordinate of the mouse's position
;;    y is the y coordinate of the mouse's position

(define MO1 (make-mouse (/ WIDTH 2) (/ HEIGHT 2)))
(define MO2 (make-mouse 300 100))

#;
(define (fn-for-mouse mouse)
  (... (mouse-x mouse)  ;Integer
       (mouse-y mouse)));Integer

;; Template rules used
;; Compound: 2 fields


;; =================
;; Functions:

;; Mouse -> Mouse
;; start the world with (main (make-mouse 0 0))
;; 
(define (main mouse)
  (big-bang mouse                      ; Mouse
            (to-draw   render-mouse)   ; Mouse -> Image
            (on-mouse  handle-mouse))) ; Mouse Integer Integer MouseEvent -> Mouse
           

;; Mouse -> Image
;; render the mouse x and y coordinates
(check-expect (render-mouse MO1) (place-image
                                  (beside 
                                    (text (number->string(/ WIDTH 2)) TEXT-SIZE TEXT-COLOR)
                                     WHITE-SPACE
                                    (text (number->string(/ HEIGHT 2)) TEXT-SIZE TEXT-COLOR))
                                  (/ WIDTH 2) (/ HEIGHT 2)
                                  MTS))
                                               
                                         

(check-expect (render-mouse MO2) (place-image
                                  (beside 
                                  (text (number->string 300) TEXT-SIZE TEXT-COLOR)
                                   WHITE-SPACE
                                   (text (number->string 100)TEXT-SIZE TEXT-COLOR))
                                        300 100
                                         MTS))
                                               
                                           

;;(define (render-mouse mouse) empty-image)

(define (render-mouse mouse)
 (place-image
   (beside
      (handle-image (mouse-x mouse))
       WHITE-SPACE
      (handle-image (mouse-y mouse)))
   (mouse-x mouse) (mouse-y mouse)
   MTS))   

;; Integer -> Image
;; return an image that holds the given number
(check-expect (handle-image 20)  (text "20" TEXT-SIZE TEXT-COLOR))
  
;;(define (handle-image number) empty-image)
(define (handle-image number)
  (text (number->string number) TEXT-SIZE TEXT-COLOR))

;; Mouse Integer Integer MouseEvent -> Mouse
;; when the mouse move change it's coordinates
(check-expect (handle-mouse MO1 15 7 "move")  (make-mouse 15 7))
(check-expect (handle-mouse MO2 15 7 "enter")  MO2)

;;(define (handle-mouse mouse x y me) mouse)

(define (handle-mouse mouse x y me)
  (cond [(mouse=? me "move") (make-mouse x y)]
        [else
         mouse]))