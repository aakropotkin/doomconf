;;; Compiled snippets and support files for `makefile-bsdmake-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'makefile-bsdmake-mode
                     '(("$" "$(${1:VAR})$0" "var" nil nil nil "/home/camus/.doom.d/snippets/makefile-bsdmake-mode/var" nil "$")
                       ("if" "@if [ ${1:cond} ]\n    then $0\nfi\n" "if" nil nil nil "/home/camus/.doom.d/snippets/makefile-bsdmake-mode/if" nil "if")
                       ("gen" "all: ${1:targets}\n\n$0\n\nclean:\n        ${2:clean actions}\n" "gen" nil nil nil "/home/camus/.doom.d/snippets/makefile-bsdmake-mode/gen" nil "gen")
                       ("echo" "@echo ${1:\"message to output\"}\n" "echo" nil nil nil "/home/camus/.doom.d/snippets/makefile-bsdmake-mode/echo" nil "echo")
                       ("phony" ".PHONY: $0" "PHONY" nil nil nil "/home/camus/.doom.d/snippets/makefile-bsdmake-mode/PHONY" nil "phony")))


;;; Do not edit! File generated at Mon Mar 20 17:06:15 2023
