;;; Compiled snippets and support files for `emacs-lisp-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'emacs-lisp-mode
                     '(("__package" ";;; `(file-name-nondirectory buffer-file-name)`${1: --- ${2:Description}} -*- lexical-binding: t; -*-\n;;\n;; Copyright (C) `(format-time-string \"%Y\")` `user-full-name`\n;;\n;; Author: `user-full-name` <https://github.com/`(cl-find-if-not #'string-empty-p (list (cdr (doom-call-process \"git\" \"config\" \"github.user\")) user-login-name))`>\n;; Maintainer: `user-full-name` <`user-mail-address`>\n;; Created: `(format-time-string \"%B %d, %Y\")`\n;; Modified: `(format-time-string \"%B %d, %Y\")`\n;; Version: 0.0.1\n;; Keywords: `(mapconcat #'symbol-name (mapcar #'car finder-known-keywords) \" \")`\n;; Homepage: https://github.com/`user-login-name`/`(file-name-base buffer-file-name)`\n;; Package-Requires: ((emacs \"24.3\"))\n;;\n;; This file is not part of GNU Emacs.\n;;\n;;; Commentary:\n;;\n;;  $2\n;;\n;;; Code:\n\n`%`$0\n\n(provide '`(file-name-base buffer-file-name)`)\n;;; `(file-name-nondirectory buffer-file-name)` ends here\n" "__package" nil nil nil "/home/camus/.doom.d/templates/emacs-lisp-mode/__package" nil nil)
                       ("__doom-test" ";; -*- no-byte-compile: t; -*-\n;;; `(+file-templates-get-short-path)`\n\n$0" "__doom-test" nil nil nil "/home/camus/.doom.d/templates/emacs-lisp-mode/__doom-test" nil nil)
                       ("__doom-packages" ";; -*- no-byte-compile: t; -*-\n;;; `(+file-templates-get-short-path)`\n\n$0\n" "__doom-packages" nil nil nil "/home/camus/.doom.d/templates/emacs-lisp-mode/__doom-packages" nil nil)
                       ("__doom-module" ";;; `(+file-templates-get-short-path)` -*- lexical-binding: t; -*-\n\n$0\n" "__doom-module" nil nil nil "/home/camus/.doom.d/templates/emacs-lisp-mode/__doom-module" nil nil)
                       ("__doom-doctor" ";;; `(+file-templates-get-short-path)` -*- lexical-binding: t; -*-\n\n$0\n" "__doom-doctor" nil nil nil "/home/camus/.doom.d/templates/emacs-lisp-mode/__doom-doctor" nil nil)))


;;; Do not edit! File generated at Fri Mar  3 16:50:57 2023
