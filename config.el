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

(setq tramp-default-method "ssh")
(autoload #'tramp-register-crypt-file-name-handler "tramp-crypt")


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
               '("pyr" . "src python :results output"))

  ;; Nix
  (add-to-list 'org-structure-template-alist '("nix" . "src nix"))
  (add-to-list 'org-structure-template-alist
               '("nixr" . "src nix :results output"))
  (add-to-list 'org-structure-template-alist
               '("nixl" . "src nix :results both :exports both"))

  ;; I cribbed most of this from
  ;; https://github.com/pope/ob-go/blob/master/ob-go.el
  ;; Shockinly it works, but obviously it's very crude.
  (defvar org-babel-nix-command "nix")

  (defun org-babel-execute:nix (body params)  ;; FIXME: params
    "Execute a block of Template code with org-babel. This function is called
by `org-babel-execute-src-block'"
    (message "executing Nix source block")
    (let* ((tmp-src-file (org-babel-temp-file "nix-src-" ".nix"))
           ;(processed-params (org-babel-process-params params))
           (coding-system-for-read 'utf-8)
           (coding-system-for-write 'utf-8))
      (with-temp-file tmp-src-file (insert body))
      (let ((results (org-babel-eval
                      (format "%s eval -f %s"
                              org-babel-nix-command
                              (org-babel-process-file-name tmp-src-file))
                      "")))
        (if results
            (org-babel-read (org-babel-trim results) t)
          (message "fuck")))))

  ; For whatever reason this works on OSX but not here?
  ;(add-to-list +org-babel-mode-alist '((nix . nix)))
)

(after! ox
  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines)))


;; -------------------------------------------------------------------------- ;;

(setq org-html-head-dank
      "<meta http-equiv='X-UA-Compatible' content='IE=edge'><meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'><style>html{touch-action:manipulation;-webkit-text-size-adjust:100%}body{padding:0;margin:0;background:#f2f6fa;color:#3c495a;font-weight:normal;font-size:15px;font-family:'San Francisco','Roboto','Arial',sans-serif}h2,h3,h4,h5,h6{font-family:'Trebuchet MS',Verdana,sans-serif;color:#586b82;padding:0;margin:20px 0 10px 0;font-size:1.1em}h2{margin:30px 0 10px 0;font-size:1.2em}a{color:#3fa7ba;text-decoration:none}p{margin:6px 0;text-align:justify}ul,ol{margin:0;text-align:justify}ul>li>code{color:#586b82}pre{white-space:pre-wrap}#content{width:96%;max-width:1000px;margin:2% auto 6% auto;background:white;border-radius:2px;border-right:1px solid #e2e9f0;border-bottom:2px solid #e2e9f0;padding:0 115px 150px 115px;box-sizing:border-box}#postamble{display:none}h1.title{background-color:#343C44;color:#fff;margin:0 -115px;padding:60px 0;font-weight:normal;font-size:2em;border-top-left-radius:2px;border-top-right-radius:2px}@media (max-width: 1050px){#content{padding:0 70px 100px 70px}h1.title{margin:0 -70px}}@media (max-width: 800px){#content{width:100%;margin-top:0;margin-bottom:0;padding:0 4% 60px 4%}h1.title{margin:0 -5%;padding:40px 5%}}pre,.verse{box-shadow:none;background-color:#f9fbfd;border:1px solid #e2e9f0;color:#586b82;padding:10px;font-family:monospace;overflow:auto;margin:6px 0}#table-of-contents{margin-bottom:50px;margin-top:50px}#table-of-contents h2{margin-bottom:5px}#text-table-of-contents ul{padding-left:15px}#text-table-of-contents>ul{padding-left:0}#text-table-of-contents li{list-style-type:none}#text-table-of-contents a{color:#7c8ca1;font-size:0.95em;text-decoration:none}table{border-color:#586b82;font-size:0.95em}table thead{color:#586b82}table tbody tr:nth-child(even){background:#f9f9f9}table tbody tr:hover{background:#586b82!important;color:white}table .left{text-align:left}table .right{text-align:right}.todo{font-family:inherit;color:inherit}.done{color:inherit}.tag{background:initial}.tag>span{background-color:#eee;font-family:monospace;padding-left:7px;padding-right:7px;border-radius:2px;float:right;margin-left:5px}#text-table-of-contents .tag>span{float:none;margin-left:0}.timestamp{color:#7c8ca1}@media print{@page{margin-bottom:3cm;margin-top:3cm;margin-left:2cm;margin-right:2cm;font-size:10px}#content{border:none}}</style>")


(setq org-html-head org-html-head-dank)


;; -------------------------------------------------------------------------- ;;

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq +file-templates-dir "~/.doom.d/templates/")


;; -------------------------------------------------------------------------- ;;
;; Set mode by file extension

(add-to-list 'auto-mode-alist '("\\.jq$" . jq-mode))


;; -------------------------------------------------------------------------- ;;

(use-package! shell
  :config
  (setq sh-basic-offset 2
        sh-indentation  2))


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

;; otherwise the invisible fci characters show up as funky looking
;; visible characters in the source code blocks in the html file.
;; http://lists.gnu.org/archive/html/emacs-orgmode/2014-09/msg00777.html
(with-eval-after-load 'fill-column-indicator
  (defvar modi/htmlize-initial-fci-state nil
    "Variable to store the state of `fci-mode' when `htmlize-buffer' is called.")

  (defun modi/htmlize-before-hook-fci-disable ()
    (setq modi/htmlize-initial-fci-state fci-mode)
    (when fci-mode
      (fci-mode -1)))

  (defun modi/htmlize-after-hook-fci-enable-maybe ()
    (when modi/htmlize-initial-fci-state
      (fci-mode 1)))

  (add-hook 'htmlize-before-hook #'modi/htmlize-before-hook-fci-disable)
  (add-hook 'htmlize-after-hook #'modi/htmlize-after-hook-fci-enable-maybe))


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

(use-package! cc-mode
	:config
  (setq indent-tabs-mode t     ;; Pressing TAB should cause indentation
        c-indent-level 2       ;; A TAB is equivelant to two spaces
        c-tab-always-indent t
        c-basic-offset 2
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

(use-package! go-mode
        :config
  (setq indent-tabs-mode t
        tab-width 2
        evil-shift-width 2))


;; -------------------------------------------------------------------------- ;;

;(use-package! ccls
;  :after projectile
;  :custom
;    (ccls-args nil)
;    (ccls-executable (executable-find "ccls"))
;    (projectile-project-root-files-top-down-recurring
;      (append '("compile_commands.json" ".ccls")
;              projectile-project-root-files-top-down-recurring))
;  :config
;    (push ".ccls-cache" projectile-globally-ignored-directories))



;; -------------------------------------------------------------------------- ;;

(defun org-in-tangle-dir (sub-path)
  "Expand the SUB-PATH into the directory given by the tangle-dir
property if that property exists, else use the
`default-directory'."
  (expand-file-name sub-path
                    (or
                     (org-entry-get (point) "tangle-dir" 'inherit)
                     (default-directory))))


;; -------------------------------------------------------------------------- ;;



;; ========================================================================== ;;
