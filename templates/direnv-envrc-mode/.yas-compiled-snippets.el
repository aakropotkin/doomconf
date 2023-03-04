;;; Compiled snippets and support files for `direnv-envrc-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'direnv-envrc-mode
                     '(("__envrc" "if type lorri &>/dev/null; then\n    echo \"direnv: using lorri\"\n    eval \"$(lorri direnv)\"\nelse\n    # fall back to using direnv's builtin nix support\n    # to prevent bootstrapping problems.\n    use nix\nfi\n\n`%`$0" "__envrc"
                        (executable-find "nix-env")
                        ("file templates")
                        nil "/home/camus/.doom.d/templates/direnv-envrc-mode/__envrc" nil nil)))


;;; Do not edit! File generated at Fri Mar  3 16:50:57 2023
