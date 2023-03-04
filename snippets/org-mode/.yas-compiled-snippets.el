;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("width" "#+attr_html: :width ${1:500px}" "#+attr_html: :width ..." nil nil nil "/home/camus/.doom.d/snippets/org-mode/width" nil nil)
                       ("verse" "#+begin_verse\n`%`$0\n#+end_verse" "verse" nil nil nil "/home/camus/.doom.d/snippets/org-mode/verse" nil "verse")
                       ("todo" "TODO ${1:task description}" "TODO item" nil nil nil "/home/camus/.doom.d/snippets/org-mode/todo" nil "todo")
                       ("name" "#+srcname: $0" "srcname" nil nil nil "/home/camus/.doom.d/snippets/org-mode/srcname" nil "name")
                       ("src_zshr" "#+BEGIN_SRC zsh :results output\n`%`$0\n#+END_SRC\n\n" "#+begin_src zsh :results output" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_zshr" nil "src_zshr")
                       ("src_zsh" "#+BEGIN_SRC zsh\n`%`$0\n#+END_SRC\n\n" "#+begin_src zsh" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_zsh" nil "src_zsh")
                       ("src_tclr" "#+BEGIN_SRC tcl :results output\n`%`$0\n#+END_SRC\n\n" "#+begin_src tcl :results output" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_tclr" nil "src_tclr")
                       ("src_tcl" "#+BEGIN_SRC tcl\n`%`$0\n#+END_SRC\n\n" "#+begin_src tcl" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_tcl" nil "src_tcl")
                       ("src_shr" "#+BEGIN_SRC sh :results output\n`%`$0\n#+END_SRC\n\n" "#+begin_src sh :results output" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_shr" nil "src_shr")
                       ("src_sh" "#+BEGIN_SRC sh\n`%`$0\n#+END_SRC\n\n" "#+begin_src sh" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_sh" nil "src_sh")
                       ("src_pyr" "#+BEGIN_SRC python :results output\n`%`$0\n#+END_SRC\n\n" "#+begin_src python :results output" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_pyr" nil "src_pyr")
                       ("src_py" "#+BEGIN_SRC python\n`%`$0\n#+END_SRC\n\n" "#+begin_src python" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_py" nil "src_py")
                       ("src_nixr" "#+BEGIN_SRC nix :results output\n`%`$0\n#+END_SRC\n\n" "#+begin_src nix :results output" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_nixr" nil "src_nixr")
                       ("src_nixl" "#+BEGIN_SRC nix :results output :exports both\n`%`$0\n#+END_SRC\n\n" "#+begin_src nix :results output :exports both" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_nixl" nil "src_nixl")
                       ("src_nix" "#+BEGIN_SRC nix\n`%`$0\n#+END_SRC\n\n" "#+begin_src nix" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_nix" nil "src_nix")
                       ("src_clr" "#+BEGIN_SRC lisp :results output\n`%`$0\n#+END_SRC\n\n" "#+begin_src lisp :results output" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_clr" nil "src_clr")
                       ("src_cl" "#+BEGIN_SRC lisp\n`%`$0\n#+END_SRC\n\n" "#+begin_src lisp" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src_cl" nil "src_cl")
                       ("src" "#+BEGIN_SRC $1\n`%`$0\n#+END_SRC\n" "#+begin_src" nil nil nil "/home/camus/.doom.d/snippets/org-mode/src" nil "src")
                       ("quote" "#+begin_quote\n`%`$0\n#+end_quote" "quote block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/quote" nil "quote")
                       ("matrix" "\\left \\(\n\\begin{array}{${1:ccc}}\n${2:v1 & v2} \\\\\n`%`$0\n\\end{array}\n\\right \\)" "matrix" nil nil nil "/home/camus/.doom.d/snippets/org-mode/matrix" nil "matrix")
                       ("latex" "#+begin_latex\n`%`$0\n#+end_latex" "latex" nil nil nil "/home/camus/.doom.d/snippets/org-mode/latex" nil "latex")
                       ("jupyter" "#+begin_src jupyter-${1:$$(yas-choose-value '(\"python\" \"julia\" \"r\"))}${2: :session $3}${4: :async yes}\n`%`$0\n#+end_src\n" "#+begin_src jupyter-..." nil nil nil "/home/camus/.doom.d/snippets/org-mode/jupyter" nil "jupyter")
                       ("img" "#+attr_html: :alt $2 :align ${3:left} :class img\n[[${1:src}]${4:[${5:title}]}]\n`%`$0" "img" nil nil nil "/home/camus/.doom.d/snippets/org-mode/img" nil "img")
                       ("head" "#+title:     ${1:untitled document}\n#+author:    ${2:`user-full-name`}\n#+email:     ${3:`user-mail-address`}\n" "org-file header" nil nil nil "/home/camus/.doom.d/snippets/org-mode/head" nil "head")
                       ("fig" "#+caption: ${1:caption}\n#+attr_latex: ${2:scale=0.75}\n#+label: fig:${3:label}\n" "figure" nil nil nil "/home/camus/.doom.d/snippets/org-mode/figure" nil "fig")
                       ("export" "#+begin_export ${1:type}\n`%`$0\n#+end_export" "export" nil nil nil "/home/camus/.doom.d/snippets/org-mode/export" nil "export")
                       ("ex" "#+begin_example\n`%`$0\n#+end_example\n" "example" nil nil nil "/home/camus/.doom.d/snippets/org-mode/example" nil "ex")
                       ("entry" "#+begin_html\n---\nlayout: ${1:default}\ntitle: ${2:title}\n---\n#+end_html\n`%`$0" "entry" nil nil nil "/home/camus/.doom.d/snippets/org-mode/entry" nil "entry")
                       ("emb" "src_${1:lang}${2:[${3:where}]}{${4:code}}" "embedded" nil nil nil "/home/camus/.doom.d/snippets/org-mode/embedded" nil "emb")
                       ("elisp" "#+begin_src emacs-lisp :tangle yes\n`%`$0\n#+end_src" "elisp" nil nil nil "/home/camus/.doom.d/snippets/org-mode/elisp" nil "elisp")
                       ("dot" "#+begin_src dot :file ${1:file} :cmdline -T${2:pdf} :exports none :results silent\n`%`$0\n#+end_src\n\n[[file:$1]]" "dot" nil nil nil "/home/camus/.doom.d/snippets/org-mode/dot" nil "dot")
                       ("code" "#+begin_${1:lang} ${2:options}\n`%`$0\n#+end_$1" "code" nil nil nil "/home/camus/.doom.d/snippets/org-mode/code" nil "code")
                       ("blog" "#+startup: showall indent\n#+startup: hidestars\n#+begin_html\n---\nlayout: default\ntitle: ${1:title}\nexcerpt: ${2:excerpt}\n---\n$0" "blog" nil nil nil "/home/camus/.doom.d/snippets/org-mode/blog" nil "blog")
                       ("<v"
                        (progn
                          (doom-snippets-expand :uuid "verse"))
                        "#+begin_verse block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_verse" nil nil)
                       ("<zshr"
                        (progn
                          (doom-snippets-expand :uuid "src_zshr"))
                        "#+begin_src zsh :results output ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_zshr" nil nil)
                       ("<zsh"
                        (progn
                          (doom-snippets-expand :uuid "src_zsh"))
                        "#+begin_src zsh ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_zsh" nil nil)
                       ("<tclr"
                        (progn
                          (doom-snippets-expand :uuid "src_tclr"))
                        "#+begin_src tcl :results output ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_tclr" nil nil)
                       ("<tcl"
                        (progn
                          (doom-snippets-expand :uuid "src_tcl"))
                        "#+begin_src tcl ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_tcl" nil nil)
                       ("<shr"
                        (progn
                          (doom-snippets-expand :uuid "src_shr"))
                        "#+begin_src sh :results output ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_shr" nil nil)
                       ("<sh"
                        (progn
                          (doom-snippets-expand :uuid "src_sh"))
                        "#+begin_src sh ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_sh" nil nil)
                       ("<pyr"
                        (progn
                          (doom-snippets-expand :uuid "src_pyr"))
                        "#+begin_src python :results output ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_pyr" nil nil)
                       ("<py"
                        (progn
                          (doom-snippets-expand :uuid "src_py"))
                        "#+begin_src python ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_py" nil nil)
                       ("<nixr"
                        (progn
                          (doom-snippets-expand :uuid "src_nixr"))
                        "#+begin_src nix :results output ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_nixr" nil nil)
                       ("<nixl"
                        (progn
                          (doom-snippets-expand :uuid "src_nixl"))
                        "#+begin_src nix :results output :exports both ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_nixl" nil nil)
                       ("<nix"
                        (progn
                          (doom-snippets-expand :uuid "src_nix"))
                        "#+begin_src nix ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_nix" nil nil)
                       ("<clr"
                        (progn
                          (sly-mode)
                          (doom-snippets-expand :uuid "src_clr"))
                        "#+begin_src lisp :results output ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_clr" nil nil)
                       ("<cl"
                        (progn
                          (sly-mode)
                          (doom-snippets-expand :uuid "src_cl"))
                        "#+begin_src lisp ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src_cl" nil nil)
                       ("<s"
                        (progn
                          (doom-snippets-expand :uuid "src"))
                        "#+begin_src ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_src" nil nil)
                       ("<q" "#+begin_quote\n`%`$0\n#+end_quote\n" "#+begin_quote block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_quote" nil "<q")
                       ("<l" "#+begin_export latex\n`%`$0\n#+end_export\n" "#+begin_export latex block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_export_latex" nil "<l")
                       ("<h" "#+begin_export html\n`%`$0\n#+end_export\n" "#+begin_export html block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_export_html" nil "<h")
                       ("<a" "#+begin_export ascii\n`%`$0\n#+end_export\n" "#+begin_export ascii" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_export_ascii" nil "<a")
                       ("<E"
                        (progn
                          (doom-snippets-expand :uuid "export"))
                        "#+begin_export ... block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_export" nil nil)
                       ("<e" "#+begin_example\n`%`$0\n#+end_example\n" "#+begin_example block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_example" nil "<e")
                       ("<c" "#+begin_comment\n`%`$0\n#+end_comment\n" "#+begin_comment block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_comment" nil "<c")
                       ("<C" "#+begin_center\n`%`$0\n#+end_center\n" "#+begin_center block" nil nil nil "/home/camus/.doom.d/snippets/org-mode/begin_center" nil "<C")))


;;; Do not edit! File generated at Fri Mar  3 16:50:44 2023
