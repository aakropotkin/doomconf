;;; Compiled snippets and support files for `rspec-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'rspec-mode
                     '(("__helper" "require 'bundler'\n\n$:.unshift File.expand_path('../lib', __FILE__)\n\nRSpec.configure do |c|\n  c.tty = true\nend\n\n$0" "__helper" nil nil nil "/home/camus/.doom.d/templates/rspec-mode/__helper" nil nil)
                       ("__.rspec" "--color\n--require spec_helper\n--format=d\n" "__.rspec" nil nil nil "/home/camus/.doom.d/templates/rspec-mode/__.rspec" nil nil)
                       ("__" "# `(file-name-nondirectory buffer-file-name)`\n\n$0" "__" nil nil nil "/home/camus/.doom.d/templates/rspec-mode/__" nil nil)))


;;; Do not edit! File generated at Fri Mar  3 16:50:58 2023
