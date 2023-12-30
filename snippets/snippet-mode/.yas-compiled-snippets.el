;;; Compiled snippets and support files for `snippet-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'snippet-mode
                     '(("#" "# -*- mode: snippet -*-\n${1:# contributor: `(user-full-name)`\n}# name: $2\n# key: ${3:trigger-key}${4:\n# condition: t}\n# --\n$0\n" "Snippet header" nil nil nil "/home/camus/.doom.d/snippets/snippet-mode/vars" nil "#")
                       ("mirror" "\\${${2:n}:${4:\\$(${5:reflection-fn})}\\}$0" "${n:$(...)} mirror" nil nil nil "/home/camus/.doom.d/snippets/snippet-mode/mirror" nil "mirror")
                       ("group" "# group : ${1:group}" "group" nil nil nil "/home/camus/.doom.d/snippets/snippet-mode/group" nil "group")
                       ("field" "\\${${1:${2:n}:}$3${4:\\$(${5:lisp-fn})}\\}$0" "${ ...  } field" nil nil nil "/home/camus/.doom.d/snippets/snippet-mode/field" nil "field")
                       ("`" "\\`$0\\`" "elisp" nil nil nil "/home/camus/.doom.d/snippets/snippet-mode/elisp" nil "`")
                       ("cont" "# contributor: `user-full-name`" "cont" nil nil nil "/home/camus/.doom.d/snippets/snippet-mode/cont" nil "cont")))


;;; Do not edit! File generated at Mon Mar 20 17:06:15 2023
