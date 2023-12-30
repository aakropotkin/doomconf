;;; Compiled snippets and support files for `lisp-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'lisp-mode
                     '(("when" "(when (${1:condition}) ${2:`(doom-snippets-format \"%n%s\")`})" "when ... (...)" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/when" nil "when")
                       ("unless" "(unless (${1:condition}) ${2:`(doom-snippets-format \"%n%s\")`})" "unless ... (...)" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/unless" nil "unless")
                       ("typecast" "(coerce ${1:object} ${2:type})" "cast" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/typecast" nil nil)
                       ("slot" "(${1:name} :initarg :${1:$(yas/substr yas-text \"[^: ]*\")}\n           :initform (error \":${1:$(yas/substr yas-text \"[^: ]*\")} must be specified\")\n           ;; :accessor ${1:$(yas/substr yas-text \"[^: ]*\")}\n           :reader ${1:$(yas/substr yas-text \"[^: ]*\")}-changed\n           :writer set-${1:$(yas/substr yas-text \"[^: ]*\")}\n           :type\n           :allocation ${3::class :instance}\n           :documentation \"${2:about-slot}\")\n$0\n" "slot" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/slot" nil nil)
                       ("if" "(if ${1:condition} ${2:`(doom-snippets-format \"%n%s\")`})" "if" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/if" nil nil)
                       ("format" "(format t \"~& $0 ~%\")" "format" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/format" nil nil)
                       ("dotimes" "(dotimes (${1:var} ${2:count}) ${3:`(doom-snippets-format \"%n%s\")`})" "dotimes" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/dotimes" nil nil)
                       ("dot"
                        (progn
                          (doom-snippets-expand :uuid "dotimes"))
                        "dotimes" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/dot" nil "dot")
                       ("dolist" "(dolist (${1:var} ${2:list}) ${3:`(doom-snippets-format \"%n%s\")`})" "dolist" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/dolist" nil nil)
                       ("dol"
                        (progn
                          (doom-snippets-expand :uuid "dolist"))
                        "dolist" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/dol" nil "dol")
                       ("do" "(do ((${1:var1} ${2:init-form} ${3:step-form})\n     (${4:var2} ${5:init-form} ${6:step-form}))  \n    (${7:condition} ${8:return-value})\n    (${9:body}))\n$0\n" "do" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/do" nil "do")
                       ("defp" "(defpackage #:${1:name}\n   (:nicknames #:${2:nick})\n   (:use #:cl #:closer-mop #:${3:package})\n   (:shadow :${4.symbol})\n   (:shadowing-import-from #:${5:package} #:${6:symbol})\n   (:export :$0))\n" "defpackage" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/defpackage" nil "defp")
                       ("cond" "(cond ($1)$2)" "cond" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/cond" nil nil)
                       ("defc" "(defclass ${1:name} (${2:inherits})\n  (${4:slots})\n  (:documentation \"${3:...}\"))" "defclass" nil nil nil "/home/camus/.doom.d/snippets/lisp-mode/class" nil "defc")))


;;; Do not edit! File generated at Mon Mar 20 17:06:15 2023
