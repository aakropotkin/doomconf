;;; Compiled snippets and support files for `json-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'json-mode
                     '(("eslint" "\"eslintConfig\": {\n    \"env\": {\n        \"es6\": true,\n        \"browser\": true,\n        \"commonjs\": true,\n        \"node\": true\n    },\n    \"parserOptions\": {\n        \"ecmaFeatures\": {\n            \"jsx\": true\n        }\n    }\n}" "eslintConfig"
                        (equal
                         (file-name-nondirectory buffer-file-name)
                         "package.json")
                        nil nil "/home/camus/.doom.d/snippets/json-mode/eslintConfig" nil "eslint")))


;;; Do not edit! File generated at Sun Mar  5 15:17:29 2023
