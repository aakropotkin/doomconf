;;; lisp/prelude.el --- General purpose helper funtions  -*- lexical-binding: t; -*-
;; ========================================================================== ;;
;;
;;
;;
;; -------------------------------------------------------------------------- ;;

;;;;; Commands

(defun ak/mapcar* (function &rest args)
  "Apply FUNCTION to successive cars of all ARGS. Return the list of results."
  ;; If no list is exhaused,
  (if (not (memq nil args))
      ;; Apply FUNCTION to CARs.
      (cons (apply function (mapcar 'car args))
            (apply 'mapcar* function
                   ;; Recurse for rest of elements
                   (mapcar 'cdr args)))))


(defun ak/mappairs (function pairs)
  "Apply FUNCTION ( of two arguments ) to successive cells of argument pairs.
Return the list of results."
  (mapcar (lambda (p) (funcall function (car p) (cdr p))) pairs))


;; -------------------------------------------------------------------------- ;;

(provide 'ak-prelude)


;; -------------------------------------------------------------------------- ;;
;;
;;
;;
;; ========================================================================== ;;
