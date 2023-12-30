;;; Compiled snippets and support files for `java-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'java-mode
                     '(("__main" "package `(+java-current-package)`;\n\npublic class `(+java-current-class)` $1\n{\n    public static void main(String[] args) {\n        $0\n    }\n}\n" "Java MAIN file template" nil nil nil "/home/camus/.doom.d/templates/java-mode/__main" nil nil)
                       ("__" "package `(+java-current-package)`;\n\npublic class `(+java-current-class)` $1\n{\n    $0\n}\n" "Java file template" nil nil nil "/home/camus/.doom.d/templates/java-mode/__" nil nil)))


;;; Do not edit! File generated at Mon Mar 20 17:06:16 2023
