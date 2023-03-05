;;; Compiled snippets and support files for `rust-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'rust-mode
                     '(("__main.rs" "use std::io;\n\nfn main() {\n    ${0:println!(\"Hello, world!\");}\n}\n" "__main.rs" nil nil nil "/home/camus/.doom.d/templates/rust-mode/__main.rs" nil nil)
                       ("__Cargo.toml" "[package]\nname = \"${1:Project Name}\"\nversion = \"0.0.1\"\nauthors = [ \"`user-full-name` <`user-mail-address`>\" ]\n$0\n" "__Cargo.toml" nil nil nil "/home/camus/.doom.d/templates/rust-mode/__Cargo.toml" nil nil)))


;;; Do not edit! File generated at Sun Mar  5 15:17:40 2023
