(in-package #:kp6-lisp)

(defclass kp6-cell ()
  ((value :initarg :value :accessor kp6-cell-value)))

(defun make-kp6-cell (value)
  (make-instance 'kp6-cell :value value))

; XXX FIXME: This was to fix t/kp6/04-add.t which was failing,
; something calls (kp6-dispatch) on a cell, we'll just forward it to
; the contained value because my CL debug fu isn't good enough to
; figure out the root cause for this -avar
(defmethod kp6-dispatch ((invocant kp6-Cell) interpreter method &rest parameters)
  (kp6-dispatch (kp6-cell-value invocant) interpreter method parameters))

;; AUTHORS
;;
;; The Pugs Team perl6-compiler@perl.org.
;;
;; SEE ALSO
;;
;; The Perl 6 homepage at http://dev.perl.org/perl6.
;;
;; The Pugs homepage at http://pugscode.org/.
;;
;; COPYRIGHT
;;
;; Copyright 2007 by Flavio Soibelmann Glock and others.
;;
;; This program is free software; you can redistribute it and/or modify it
;; under the same terms as Perl itself.
;;
;; See http://www.perl.com/perl/misc/Artistic.html
