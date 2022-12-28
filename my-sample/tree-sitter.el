;;; nema-tree-sitter --- Incremental parsing
;;; Commentary:
"Incremental parsing"
;;; Code:

(defvar nema--tree-sitter-grammatical-edit-lang-hooks
  '(c-mode-common-hook
    c-mode-hook
    c++-mode-hook
    java-mode-hook
    haskell-mode-hook
    ;; emacs-lisp-mode-hook
    lisp-interaction-mode-hook
    lisp-mode-hook
    maxima-mode-hook
    ielm-mode-hook
    sh-mode-hook
    makefile-gmake-mode-hook
    php-mode-hook
    python-mode-hook
    js-mode-hook
    go-mode-hook
    qml-mode-hook
    jade-mode-hook
    css-mode-hook
    ruby-mode-hook
    coffee-mode-hook
    rust-mode-hook
    qmake-mode-hook
    lua-mode-hook
    swift-mode-hook
    minibuffer-inactive-mode-hook
    typescript-mode-hook
    tuareg-mode-hook
    elixir-mode-hook)
  "All language mode hooks to use tree-sitter grammatical-edit (instead of puni-mode).")

;; tree-sitter-core
(use-package tree-sitter
  :demand t)

(use-package tree-sitter-langs
  :after tree-sitter
  :config
  (require 'tree-sitter-hl)
  (require 'tree-sitter-query)
  (global-tree-sitter-mode)
  (delight 'tree-sitter-mode nil 'tree-sitter)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

  (add-to-list 'tree-sitter-major-mode-language-alist '(ng2-ts-mode . typescript)))

(use-package tree-sitter-indent
  :after tree-sitter)

;; Structure editing based on tree-sitter
;; (use-package grammatical-edit
;;   :quelpa (grammatical-edit :fetcher github :repo "manateelazycat/grammatical-edit")
;;   :demand t
;;   :bind ((:map grammatical-edit-mode-map
;;                ("(" . grammatical-edit-open-round)
;;                ("[" . grammatical-edit-open-bracket)
;;                ("{" . grammatical-edit-open-curly)
;;                (")" . grammatical-edit-close-round)
;;                ("]" . grammatical-edit-close-bracket)
;;                ("}" . grammatical-edit-close-curly)
;;                ("=" . grammatical-edit-equal)

;;                ("%" . grammatical-edit-match-paren)
;;                ("\"" . grammatical-edit-double-quote)

;;                ("SPC" . grammatical-edit-space)
;;                ("RET" . grammatical-edit-newline)

;;                ("M-o" . grammatical-edit-backward-delete)
;;                ("C-d" . grammatical-edit-forward-delete)
;;                ("C-k" . grammatical-edit-kill)

;;                ("M-\"" . grammatical-edit-wrap-double-quote)
;;                ("M-[" . grammatical-edit-wrap-bracket)
;;                ("M-{" . grammatical-edit-wrap-curly)
;;                ("M-(" . grammatical-edit-wrap-round)
;;                ("M-)" . grammatical-edit-unwrap)

;;                ("M-p" . grammatical-edit-jump-right)
;;                ("M-n" . grammatical-edit-jump-left)
;;                ("M-:" . grammatical-edit-jump-out-pair-and-newline)))
;;   :config
;;   (dolist (hook nema--tree-sitter-grammatical-edit-lang-hooks)
;;     (add-hook hook #'(lambda ()
;;                       (puni-disable-puni-mode)
;;                       (grammatical-edit-mode 1)))))

;;; tree-sitter.el ends here
