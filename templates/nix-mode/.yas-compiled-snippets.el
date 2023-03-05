;;; Compiled snippets and support files for `nix-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'nix-mode
                     '(("__shell.nix" "{ pkgs ? import <nixpkgs> {} }:\n\nwith pkgs;\n\nmkShell {\n  buildInputs = [\n    ${0:`%`}\n  ];\n}" "__shell.nix" nil nil nil "/home/camus/.doom.d/templates/nix-mode/__shell.nix" nil nil)
                       ("__" "# ============================================================================ #\n#\n#\n#\n# ---------------------------------------------------------------------------- #\n\n{ lib }: let\n\n# ---------------------------------------------------------------------------- #\n\n$0\n\n\n# ---------------------------------------------------------------------------- #\n\nin {\n\n}\n\n\n# ---------------------------------------------------------------------------- #\n#\n#\n#\n# ============================================================================ #" "__" nil
                        ("file templates")
                        nil "/home/camus/.doom.d/templates/nix-mode/__" nil nil)))


;;; Do not edit! File generated at Sun Mar  5 15:17:40 2023
