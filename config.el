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

;; `add-load-path!' processes paths relative to "this" file.
(add-load-path! "lisp")


;; -------------------------------------------------------------------------- ;;

(setq user-full-name    "Alex Ameen"
      user-mail-address (if (eq config-kind :HOME)
                          "alex.ameen.tx@gmail.com"
                          "alex.ameen@tulip.co"))


;; -------------------------------------------------------------------------- ;;

(setq tramp-default-method "ssh")
(autoload #'tramp-register-crypt-file-name-handler "tramp-crypt")

(add-to-list 'exec-path
             (concat (getenv "HOME") ""))


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

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/docs/notes")

(setq org-default-notes-file (concat org-directory "/notes.org"))

(defun ak/org-open-default-notes ()
  "Open the default Org notes file set by `org-default-notes-file'."
  (find-file org-default-notes-file))

(defun ak/evil-org-notes ()
  "Open the default Org notes file set by `org-default-notes-file'."
  (interactive)
  (ak/org-open-default-notes))

(evil-ex-define-cmd "ak/org-open-default-notes" 'ak/evil-org-notes)
(evil-ex-define-cmd "ak/org-notes"              'ak/evil-org-notes)

(map! :leader
      (:prefix-map ("n" . "notes")
       :desc "Org default notes" "h" #'ak/evil-org-notes))

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


(defun ak/org-get-headline-at-point ()
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

(defun ak/org-structure--mk-lang (lang &optional alias)
  (let* ((name (or alias lang))
         (t-base (concat "src " lang))
         (t-rsl (concat t-base " :results output :exports results"))
         (t-lit (concat t-base " :results both :exports both")))
    (dolist (structure
            (list (cons name t-base)
                  (cons (concat name "r") t-rsl)
                  (cons (concat name "l") t-lit)))
        (add-to-list 'org-structure-template-alist structure))))

(defun ak/org-add-custom-templates ()
  (progn (ak/org-structure--mk-lang "sh")
         (ak/org-structure--mk-lang "zsh")
         (ak/org-structure--mk-lang "lisp" "cl")
         (ak/org-structure--mk-lang "tcl")
         (ak/org-structure--mk-lang "python" "py")
         (ak/org-structure--mk-lang "nix")))

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


(after! org
  (ak/org-add-custom-templates)

  ;; I cribbed most of this from
  ;; https://github.com/pope/ob-go/blob/master/ob-go.el
  ;; Shockinly it works, but obviously it's very crude.
  (defvar org-babel-nix-command "nix")

  ; For whatever reason this works on OSX but not here?
  ;(add-to-list +org-babel-mode-alist '((nix . nix)))
  (map! :leader
        (:prefix-map ("j" . "jump")
        :desc "Previous block" "k" #'org-previous-block)
        (:prefix-map ("j" . "jump")
        :desc "Next block" "j" #'org-next-block))
)

(after! ox
  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines)))


;; -------------------------------------------------------------------------- ;;

(setq org-html-head-dank (concat "
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta content='width=device-width, initial-scale=1, maximum-scale=1,
               user-scalable=no'
      name='viewport'>
<style>"
(with-temp-buffer
  (insert-file-contents "~/.doom.d/org-export.css")
  (buffer-string))
"</style>"
))

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

(use-package! fci-mode
  :after-call doom-before-switch-buffer-hook
  :config
  (defvar-local company-fci-mode-on-p nil)

  (defun ak/company-turn-off-fci (&rest ignore)
    (setq company-fci-mode-on-p fci-mode)
    (when fci-mode (fci-mode -1)))

  (defun ak/company-maybe-turn-on-fci (&rest ignore)
    (when company-fci-mode-on-p (fci-mode 1)))

  (add-hook 'company-completion-started-hook #'ak/company-turn-off-fci)
  (add-hook 'company-completion-finished-hook #'ak/company-turn-on-fci)
  (add-hook 'company-completion-cancelled-hook #'ak/company-turn-on-fci))

(add-hook 'prog-mode-hook #'fci-mode)

;; otherwise the invisible fci characters show up as funky looking
;; visible characters in the source code blocks in the html file.
;; http://lists.gnu.org/archive/html/emacs-orgmode/2014-09/msg00777.html
(with-eval-after-load 'fill-column-indicator
  (defvar ak/htmlize-initial-fci-state nil
    "Variable to store the state of `fci-mode' when `htmlize-buffer' is called.")

  (defun ak/htmlize-before-hook-fci-disable ()
    (setq ak/htmlize-initial-fci-state fci-mode)
    (when fci-mode (fci-mode -1)))

  (defun ak/htmlize-after-hook-fci-enable-maybe ()
    (when ak/htmlize-initial-fci-state (fci-mode 1)))

  (add-hook 'htmlize-before-hook #'ak/htmlize-before-hook-fci-disable)
  (add-hook 'htmlize-after-hook #'ak/htmlize-after-hook-fci-enable-maybe))


;; -------------------------------------------------------------------------- ;;

;; Insert shell command output into buffer
(defun ak/insert-shell-output (command)
  "Insert output of shell COMMAND at point in current buffer."
  (insert (shell-command-to-string command)))

(after! evil
  (defun ak/evil-insert-shell-output (command)
    "Makes `ak/insert-shell-output' available as an EX command."
    (interactive "MShell Command: ")
    (ak/insert-shell-output command))

  (evil-ex-define-cmd "ak/insert-shell-output" 'ak/evil-insert-shell-output)
  ;; maps ` i\'
  (map! :leader
        (:prefix-map ("i" . "insert")
         :desc "Shell cmd output" "\\" 'ak/evil-insert-shell-output)))


;; -------------------------------------------------------------------------- ;;

(use-package! evil-visual-replace
  :after evil
  :config
  (evil-visual-replace-visual-bindings))


;; -------------------------------------------------------------------------- ;;

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
        backward-delete-function nil)  ;; Do not expand tabs when deleting

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

  (require 'ak-prelude)
  (ak/mappairs 'c-set-offset '((defun-open         -)
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

(defun ak/org-in-tangle-dir (sub-path)
  "Expand the SUB-PATH into the directory given by the tangle-dir
property if that property exists, else use the
`default-directory'."
  (expand-file-name sub-path
                    (or
                     (org-entry-get (point) "tangle-dir" 'inherit)
                     (default-directory))))


;; -------------------------------------------------------------------------- ;;

(defun ak/emacs-lisp-mode-hook ()
  (setq indent-tabs-mode nil
        tab-width 2
        evil-shift-width 2))

(add-hook 'emacs-lisp-mode-hook #'ak/emacs-lisp-mode-hook)


;; -------------------------------------------------------------------------- ;;

;; FIXME: different on every box
(setq nixpkgs-source-path "/data/repos/nixpkgs")
(setq nix-source-path "/data/repos/nix")

(after! nix
  ;; XXX: See `org-roam' note "nix-find-def" for a hideous way to lookup
  ;; the file/line where an attribute or function was defined.
  (require 'ivy)

  (defun ak/nix-search-nix ()
    "Search for `query' in Nix using `ivy'."
    (interactive)
    (+ivy-file-search :query nil :in nix-source-path :all-files nil))

  (defun ak/nix-search-nixpkgs ()
    "Search for `query' in Nixpkgs using `ivy'."
    (interactive)
    (+ivy-file-search :query nil :in nixpkgs-source-path :all-files nil))

  (require 'nix-buffer)

  (map! :localleader
        :map nix-mode-map
        "u" #'nix-update-fetch
        ;"f" #'nix-update-fetch
        ;"F" #'nix-flake
        "p" #'nix-format-buffer
        "r" #'nix-repl-show
        "S" #'nix-shell
        "B" #'nix-build
        (:prefix-map ("s" . "search-nix")
         "n" #'ak/nix-search-nix
         "p" #'ak/nix-search-nixpkgs)
        ;"u" #'nix-unpack
        ;"o" #'+nix/lookup-option
        ) ;; End Local Leader Map

  ) ;; End nix

(add-hook 'nix-mode-local-vars-hook #'lsp!)

(use-package! lsp
  :config
  (add-to-list 'lsp-language-id-configuration '(nix-mode . "nix"))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("rnix-lsp"))
    :major-modes '(nix-mode)
    :server-id 'nix)))


;; -------------------------------------------------------------------------- ;;
;;
;;
;;
;; ========================================================================== ;;
