;;; Compiled snippets and support files for `fundamental-mode'
;;; contents of the .yas-setup.el support file:
;;;
;; -*- no-byte-compile: t; -*-
(require 'doom-snippets-lib);;; Snippet definitions:
;;;
(yas-define-snippets 'fundamental-mode
                     '(("time" "`(current-time-string)`" "(current time)" nil nil nil "/home/camus/.doom.d/snippets/fundamental-mode/time" nil "time")
                       ("mode" "`comment-start`-*- mode: ${1:mode} -*-`comment-end`" "mode"
                        (=
                         (line-number-at-pos)
                         1)
                        nil nil "/home/camus/.doom.d/snippets/fundamental-mode/mode" nil "mode")
                       ("elvar" "`comment-start`-*- ${1:var}: ${2:value} -*-`comment-end`" "var" nil nil nil "/home/camus/.doom.d/snippets/fundamental-mode/localvar" nil "elvar")
                       ("email" "`user-mail-address`\n" "(user's email)" nil nil nil "/home/camus/.doom.d/snippets/fundamental-mode/email" nil "email")
                       ("#!" "#!/usr/bin/env ${1:bash}\n\n$0\n" "bang" nil nil nil "/home/camus/.doom.d/snippets/fundamental-mode/bang" nil "#!")))


;;; Do not edit! File generated at Mon Mar 20 17:06:15 2023
