;;; Compiled snippets and support files for `cmake-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'cmake-mode
                     '(("set" "set(${1:var} ${2:value})" "set" nil nil nil "/home/camus/.doom.d/snippets/cmake-mode/set" nil "set")
                       ("proj" "project ($0)" "project" nil nil nil "/home/camus/.doom.d/snippets/cmake-mode/project" nil "proj")
                       ("opt" "option (${1:OPT} \"${2:docstring}\" ${3:value})" "option" nil nil nil "/home/camus/.doom.d/snippets/cmake-mode/option" nil "opt")
                       ("msg" "message(${1:STATUS }\"$0\")" "message" nil nil nil "/home/camus/.doom.d/snippets/cmake-mode/message" nil "msg")
                       ("macro" "macro(${1:name}${2: args})\n\nendmacro()" "macro" nil nil nil "/home/camus/.doom.d/snippets/cmake-mode/macro" nil "macro")
                       ("inc"
                        (progninclude
                         ($0))
                        "include" nil nil nil "/home/camus/.doom.d/snippets/cmake-mode/include" nil "inc")
                       ("if" "if(${1:cond})\n        $2\nelse(${3:cond})\n        $0\nendif()" "ifelse" nil nil nil "/home/camus/.doom.d/snippets/cmake-mode/ifelse" nil "if")
                       ("if" "if(${1:cond})\n   $0\nendif()" "if" nil nil nil "/home/camus/.doom.d/snippets/cmake-mode/if" nil "if")
                       ("fun" "function (${1:name})\n         $0\nendfunction()" "function" nil nil nil "/home/camus/.doom.d/snippets/cmake-mode/function" nil "fun")
                       ("for" "foreach(${1:item} \\${${2:array}})\n        $0\nendforeach()" "foreach" nil nil nil "/home/camus/.doom.d/snippets/cmake-mode/foreach" nil "for")
                       ("min" "cmake_minimum_required(VERSION ${1:2.6})" "cmake_minimum_required" nil nil nil "/home/camus/.doom.d/snippets/cmake-mode/cmake_minimum_required" nil "min")))


;;; Do not edit! File generated at Mon Mar 20 17:06:14 2023
