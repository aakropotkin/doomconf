;;; Compiled snippets and support files for `c-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c-mode
                     '(("__h" "#ifndef ${1:`_(upcase (file-name-base))`_H$(upcase yas-text)}\n#define $1\n\n/* ========================================================================== */\n\n$0\n\n\n/* -------------------------------------------------------------------------- */\n\n\n\n/* ========================================================================== */\n#endif  /* $1 */\n" "__h" nil
                        ("file templates")
                        nil "/home/camus/.doom.d/templates/c-mode/__h" nil nil)
                       ("__c" "#include \"`(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`.h\"\n\n/* ========================================================================== */\n\n$0\n\n\n/* -------------------------------------------------------------------------- */\n\n\n\n/* ========================================================================== */\n" "__c" nil
                        ("file templates")
                        nil "/home/camus/.doom.d/templates/c-mode/__c" nil nil)))


;;; Do not edit! File generated at Mon Mar 20 17:06:16 2023
