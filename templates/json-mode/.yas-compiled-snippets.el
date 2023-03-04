;;; Compiled snippets and support files for `json-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'json-mode
                     '(("__package.json" "{\n  \"name\": \"${1:package-name}\",\n  \"description\": \"${2:description}\",\n  \"version\": \"1.0.0\",\n  \"author\": \"`user-full-name` <`user-mail-address`>\",\n  \"license\": \"MIT\",\n  \"main\": \"${3:app/${4:main.js}}\",\n  \"scripts\": {\n    $0\n  },\n  \"dependencies\": {},\n  \"devDependencies\": {}\n}" "__package.json" nil nil nil "/home/camus/.doom.d/templates/json-mode/__package.json" nil nil)
                       ("__bower.json" "{\n  \"name\": \"${1:package-name}\",\n  \"description\": \"${2:description}\",\n  \"license\": \"MIT\",\n  \"authors\": [\n    \"`user-full-name` <`user-mail-address`>\"\n  ],\n  \"main\": \"public/app.js\",\n  \"moduleType\": [],\n  \"homepage\": \"\",\n  \"dependencies\": {\n    `%`$0\n  }\n}" "__bower.json" nil nil nil "/home/camus/.doom.d/templates/json-mode/__bower.json" nil nil)
                       ("__" "[\n    $0\n]\n" "__" nil nil nil "/home/camus/.doom.d/templates/json-mode/__" nil nil)))


;;; Do not edit! File generated at Fri Mar  3 16:50:57 2023
