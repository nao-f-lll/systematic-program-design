;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDF_Design_Quiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)

;; Image Image-> Boolean
;; produce true if the first image area is bigger than the second
(check-expect (is-larger (rectangle 10 20 "solid" "red") (rectangle 20 10 "solid" "red")) false)
(check-expect (is-larger (rectangle 10 10 "solid" "red") (rectangle 20 20 "solid" "red")) false)
(check-expect (is-larger (rectangle 20 20 "solid" "red") (square 10 "solid" "red")) true)
(check-expect (is-larger (square 10 "solid" "red") (rectangle 10 10 "solid" "red")) false)

;(define (is-larger image1 image2) true)

;(define (is-larger image1 image2)
;  (... image1 image2))

(define (is-larger image1 image2)
  (> (* (image-width image1) (image-height image1))  (* (image-width image2) (image-height image2))))