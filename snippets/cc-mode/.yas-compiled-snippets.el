;;; Compiled snippets and support files for `cc-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'cc-mode
                     '(("while" "while ( ${1:condition} )\n  {\n    $0\n  }" "while" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/while" nil nil)
                       ("typedef" "typedef ${1:type}  ${2:alias};" "typedef" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/typedef" nil nil)
                       ("?" "( ${1:cond} ) ? ${2:then} : ${3:else};" "ternary" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/ternary" nil "?")
                       ("switch" "switch ( ${1:variable} )\n  {\n    case ${2:value}:\n      $0\n      break;\n  }\n" "switch" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/switch" nil nil)
                       ("struct" "struct ${1:name} {\n  $0\n};" "struct ... { ... }" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/struct" nil "struct")
                       ("once" "#ifndef ${1:`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))`_H}\n#define $1\n\n/* ========================================================================== */\n\n$0\n\n\n/* -------------------------------------------------------------------------- */\n\n\n\n/* ========================================================================== */\n#endif  /* $1 */" "#ifndef XXX; #define XXX; #endif" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/once" nil "once")
                       ("math" "#include <math.h>$0" "math" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/math" nil nil)
                       ("main" "  int\nmain( ${1:int argc, char * argv[], char ** envp} )\n{\n  `%`$0\n  return 0;\n}" "main"
                        (doom-snippets-bolp)
                        nil nil "/home/camus/.doom.d/snippets/cc-mode/main" nil nil)
                       ("incc" "#include <$0>" "#include <...>"
                        (doom-snippets-bolp)
                        nil nil "/home/camus/.doom.d/snippets/cc-mode/incc" nil nil)
                       ("inc" "#include \"$0\"" "#include \"...\""
                        (doom-snippets-bolp)
                        nil nil "/home/camus/.doom.d/snippets/cc-mode/inc" nil nil)
                       ("ifdef" "#ifdef ${1:MACRO}\n\n$0\n\n#endif  /* $1 */" "ifdef"
                        (doom-snippets-bolp)
                        nil nil "/home/camus/.doom.d/snippets/cc-mode/ifdef" nil "ifdef")
                       ("if" "if ( ${1:condition} )\n  {\n    `%`$0\n  }" "if (...) { ... }" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/if" nil "if")
                       ("for" "for ( ${1:i = 0}; ${2:i < N}; ${3:i++} )\n  {\n    $0\n  }" "for" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/for" nil "for")
                       ("elseif" "else if ( ${1:condition} )\n  {\n    `%`$0\n  }" "elseif" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/elseif" nil nil)
                       ("else" "else\n  {\n    `%`$0\n  }" "else" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/else" nil nil)
                       ("do" "do {\n    $0\n} while (${1:condition});" "do { ... } while (...)" nil nil nil "/home/camus/.doom.d/snippets/cc-mode/do" nil nil)))


;;; Do not edit! File generated at Mon Mar 20 17:06:14 2023
