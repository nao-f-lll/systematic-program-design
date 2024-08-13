;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname student-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; student-starter.rkt

;; =================
;; Data definitions:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                          ;
;                         PROBLEM A:                       ;
;                                                          ;
;  Design a data definition to help a teacher organize     ;
;  their next field trip. On the trip, lunch must be       ;
;  provided for all students. For each student, track      ;
;  their name, their grade (from 1 to 12), and whether     ;
;  or not they have allergies.                             ;
;                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct student (name grade hasAllergies))
;; Student is (make-student "String" Integer Boolean)
;; interp. (make-student name grade hasAllergies) is a student with
;;          name is the student's name
;;          grade is the student's grade
;;          hasAllergies is the student's current status with allergies

(define STUDENT1 (make-student "Monica" 7 false))
(define STUDENT2 (make-student "James" 12 true))
(define STUDENT3 (make-student "Axel" 1 false))
(define STUDENT4 (make-student "Yuki" 6 true))
#;
(define (fn-for-student student)
  (... (student-name student)           ; String
       (student-grade student)          ; Integer
       (student-hasAllergies student))) ; Boolean

;; Template rules used:
;; - Compound: 3 fields

;; =================
;; Functions:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                                          ;
;                         PROBLEM B:                       ;
;                                                          ;
;  To plan for the field trip, if students are in grade 6  ;
;  or below, the teacher is responsible for keeping track  ;
;  of their allergies. If a student has allergies, and is  ;
;  in a qualifying grade, their name should be added to a  ;
;  special list. Design a function to produce true if a    ;
;  student name should be added to this list.              ;
;                                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Student -> Boolean
;; produce true if student has allergies nad is in 6 grade or below
(check-expect (should-be-added STUDENT1) false)
(check-expect (should-be-added STUDENT2) false)
(check-expect (should-be-added STUDENT3) false)
(check-expect (should-be-added STUDENT4) true)

;;(define (should-be-added student) true)

(define (should-be-added student)
  (and (<= (student-grade student) 6)
       (student-hasAllergies student)))