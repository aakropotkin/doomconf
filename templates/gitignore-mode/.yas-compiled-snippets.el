;;; Compiled snippets and support files for `gitignore-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'gitignore-mode
                     '(("__" ".DS_Store\n.idea\n*.log\ntmp/\n\n`(let ((type-ignore (yas-choose-value '(\"(none)\" \"python\" \"ruby\" \"java\" \"js\"))))\n    (string-join\n       (cond ((string= type-ignore \"python\")\n              '(\"*.py[cod]\"\n                \"*.egg\"\n                \"build\"\n                \"htmlcov\"))\n             ((string= type-ignore \"ruby\")\n             '(\".ruby-version\"\n               \".bundle\"\n               \"vendor\"\n               \"Gemfile.lock\"\n               \"coverage\"))\n             ((string= type-ignore \"java\")\n             '(\"*.class\"\n               \"build\"))\n             ((string= type-ignore \"js\")\n             '(\"*.tern-port\"\n               \"node_modules/\"\n               \"npm-debug.log*\"\n               \"yarn-debug.log*\"\n               \"yarn-error.log*\"\n               \"*.tsbuildinfo\"\n               \".npm\"\n               \".eslintcache\")))\n       \"\\n\"))`\n" "__" nil nil nil "/home/camus/.doom.d/templates/gitignore-mode/__" nil nil)))


;;; Do not edit! File generated at Fri Mar  3 16:50:57 2023
