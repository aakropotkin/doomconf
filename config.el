;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; ========================================================================== ;;
;;
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;;
;;
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;;
;;
;; -------------------------------------------------------------------------- ;;

(setq user-full-name    "Alex Ameen"
      user-mail-address (if (eq config-kind :HOME)
                          "alex.ameen.tx@gmail.com"
                          "aameen@cadence.com"))


;; -------------------------------------------------------------------------- ;;
;;
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;;
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'doom-one)
(set-face-background 'mouse "white")


;; -------------------------------------------------------------------------- ;;
;;
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory (if (eq config-kind :WORK)
                        "~/docs"
                      "~/docs/notes"))

(setq org-default-notes-file (concat org-directory "/notes.org"))

(defun org-open-default-notes ()
  "Open the default Org notes file set by `org-default-notes-file'."
  (find-file org-default-notes-file))

(defun evil-org-notes ()
  "Open the default Org notes file set by `org-default-notes-file'."
  (interactive)
  (org-open-default-notes))

(evil-ex-define-cmd "org-open-default-notes" 'evil-org-notes)
(evil-ex-define-cmd "org-notes"              'evil-org-notes)

(map! :leader
      (:prefix-map ("n" . "notes")
       :desc "Org default notes" "h" #'evil-org-notes))

;; Insert "Open `org-notes'" as below "Reload last session" ( second element )
(setcdr
 +doom-dashboard-menu-sections
 (cons
  '("Open org-notes"
    :icon (all-the-icons-fileicon "org" :face 'doom-dashboard-menu-title)
    :when (file-exists-p org-default-notes-file)
    :action evil-org-notes)
  (cdr +doom-dashboard-menu-sections)))


;; Setting these before `org' is explicitly used is necessary for org protocol.
(setq org-capture-templates
  '(("P" "Protocol" entry
    (file+headline +org-capture-notes-file "Inbox")
     "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
   ("L" "Protocol Link" entry
    (file+headline +org-capture-notes-file "Inbox")
     "* %? [[%:link][%:description]] \nCaptured On: %U")))


(defun org-get-headline-at-point ()
  "Return the Org headline at the cursor.
This is suitable for use with `org-map-entries' calls to collect headlines."
  (interactive)
  (save-excursion
    (org-back-to-heading)
    (message "%s"
             (seq-drop-while (lambda (elt) (or (eq elt ?\*) (eq elt ?\s)))
                             (buffer-substring-no-properties
                               (line-beginning-position)
                               (line-end-position))))))

;; This is the danks:
;;
;; (org-list-to-lisp)  ; targets under cursor
;;
;; For example, the following list:
;;  1. first item
;;     + sub-item one
;;     + [X] sub-item two
;;     more text in first item
;;  2. [@3] last item
;;
;; is parsed as
;;
;;  (ordered
;;   ("first item"
;;    (unordered
;;     ("sub-item one")
;;     ("[X] sub-item two"))
;;    "more text in first item")
;;   ("[@3] last item"))


(use-package! org-roam
  :ensure t
  :init (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename (concat org-directory "/roam"))))

(after! org
  ;; Sh ( Bash )
  (add-to-list 'org-structure-template-alist '("sh" . "src sh"))
  (add-to-list 'org-structure-template-alist
               '("shr" . "src sh :results output"))
  ;; Zsh
  (add-to-list 'org-structure-template-alist '("zsh" . "src zsh"))
  (add-to-list 'org-structure-template-alist
               '("zshr" . "src zsh :results output"))
  ;; Common Lisp
  (add-to-list 'org-structure-template-alist '("cl" . "src lisp"))
  (add-to-list 'org-structure-template-alist
               '("clr" . "src lisp :results output"))
  ;; Tcl
  (add-to-list 'org-structure-template-alist '("tcl" . "src tcl"))
  (add-to-list 'org-structure-template-alist
               '("tclr" . "src tcl :results output"))
  ;; Python
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist
               '("pyr" . "src python :results output")))


;; -------------------------------------------------------------------------- ;;

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq +file-templates-dir "~/.doom.d/templates/")


;; -------------------------------------------------------------------------- ;;
;;
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;;
;; -------------------------------------------------------------------------- ;;

(defun mapcar* (function &rest args)
  "Apply FUNCTION to successive cars of all ARGS.
Return the list of results."
  ;; If no list is exhaused,
  (if (not (memq nil args))
      ;; Apply FUNCTION to CARs.
      (cons (apply function (mapcar 'car args))
            (apply 'mapcar* function
                   ;; Recurse for rest of elements
                   (mapcar 'cdr args)))))


(defun mappairs (function pairs)
  "Apply FUNCTION ( of two arguments ) to successive cells of argument pairs.
Return the list of results."
  (mapcar (lambda (p) (funcall function (car p) (cdr p))) pairs))


;; Fill Column Indicator: --------------------------------------------------- ;;

(use-package! fci-mode
  :after-call doom-before-switch-buffer-hook
  :config
  (defvar-local company-fci-mode-on-p nil)

  (defun company-turn-off-fci (&rest ignore)
    (setq company-fci-mode-on-p fci-mode)
    (when fci-mode (fci-mode -1)))

  (defun company-maybe-turn-on-fci (&rest ignore)
    (when company-fci-mode-on-p (fci-mode 1)))

  (add-hook 'company-completion-started-hook #'company-turn-off-fci)
  (add-hook 'company-completion-finished-hook #'company-turn-on-fci)
  (add-hook 'company-completion-cancelled-hook #'company-turn-on-fci))

(add-hook 'prog-mode-hook #'fci-mode)


;; -------------------------------------------------------------------------- ;;

;; Insert shell command output into buffer
(defun insert-shell-output (command)
  "Insert output of shell COMMAND at point in current buffer."
  (insert (shell-command-to-string command)))

(after! evil
  (defun evil-insert-shell-output (command)
    "Makes `insert-shell-output' available as an EX command."
    (interactive "MShell Command: ")
    (insert-shell-output command))

  (evil-ex-define-cmd "insert-shell-output" 'evil-insert-shell-output)
  ;; maps ` i\'
  (map! :leader
        (:prefix-map ("i" . "insert")
         :desc "Shell cmd output" "\\" 'evil-insert-shell-output)))


;; -------------------------------------------------------------------------- ;;

(use-package! evil-visual-replace
  :after evil
  :config
  (evil-visual-replace-visual-bindings))


;; -------------------------------------------------------------------------- ;;

;;(use-package! slime
;;  :defer t
;;  :init
;;  (setq inferior-lisp-program "sbcl")
;;  :config
;;  (set-repl-handler! 'lisp-mode #'sly-mrepl)
;;  (set-eval-handler! 'lisp-mode #'sly-eval-region)
;;  (set-lookup-handlers! 'lisp-mode
;;    :definition #'sly-edit-definition
;;    :documentation #'sly-describe-symbol)
;;  (add-hook 'lisp-mode-hook #'rainbow-delimiters-mode))

(use-package! sly
  :defer t
  :config
  (setq inferior-lisp-program "sbcl"))


;; -------------------------------------------------------------------------- ;;

(when (eq config-kind :WORK)
  (add-load-path! "/grid/common/pkgs/llvm/v6.0.1/share/clang/")
  (use-package! clang-include-fixer))


;; -------------------------------------------------------------------------- ;;

(use-package! cc-mode
	:config
  (setq indent-tabs-mode t     ;; Pressing TAB should cause indentation
        c-indent-level 2       ;; A TAB is equivelant to two spaces
        c-tab-always-indent t c-basic-offset 2
        tab-width 2
        evil-shift-width 2
        backward-delete-function nil  ;; Do not expand tabs when deleting
        )

  (sp-local-pair 'cc-mode "`" "'")  ;; Use Latex style quotes

  ;;(after! lsp-clangd
  ;; (let ((gcc-libdir (file-name-directory (shell-command-to-string "gcc -print-libgcc-file-name"))))
  ;;   (add-to-list 'lsp-clients-clangd-args (concat "-I" gcc-libdir "include"))
  ;;   (add-to-list 'lsp-clients-clangd-args (concat "-I" gcc-libdir "include-fixed")))
  ;; (add-to-list 'lsp-clients-clangd-args
  ;;   (concat "-I" (string-trim-right (shell-command-to-string "nix eval --no-update-lock-file --raw nixpkgs\#glibc.dev 2>/dev/null")) "/include")))

  ;;(defun my-c-lineup-inclass (langelem)
  ;; (let ((inclass (assoc 'inclass c-syntactic-context)))
  ;;  (save-excursion
  ;;    (goto-char (c-langelem-pos inclass))
  ;;    (if (or (looking-at "struct")
  ;;            (looking-at "typedef struct"))
  ;;        '+
  ;;      '++))))

  (mappairs 'c-set-offset '((defun-open         -)
                            (substatement-open  +))))


;; -------------------------------------------------------------------------- ;;

(when (eq config-kind :WORK)
  (use-package! p4))


;; -------------------------------------------------------------------------- ;;



;; ========================================================================== ;;
