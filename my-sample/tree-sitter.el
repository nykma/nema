;;; nema-tree-sitter --- Incremental parsing
;;; Commentary:
"Incremental parsing"
;;; Code:

(use-package tree-sitter
  :quelpa (tree-sitter :fetcher github :repo "ubolonton/emacs-tree-sitter" :files ("lisp/*.el")))

(use-package tree-sitter-langs
  :quelpa (tree-sitter-langs :fetcher github :repo "ubolonton/emacs-tree-sitter" :files ("langs/*.el" "langs/queries"))
  :after tree-sitter
  :config
  (require 'tree-sitter-hl)
  (global-tree-sitter-mode)
  (delight 'tree-sitter-mode nil 'tree-sitter)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

  (add-to-list 'tree-sitter-major-mode-language-alist '(tuareg-mode . ocaml))
  (add-to-list 'tree-sitter-major-mode-language-alist '(ng2-ts-mode . typescript))

  ;; (dolist (lang tree-sitter-major-mode-language-alist) ;; (agda-mode . agda)
  ;;   (let* ((lang-mode (car lang))
  ;;          (lang-hook-string (format "%s-hook" lang-mode))
  ;;          (lang-hook (intern-soft lang-hook-string)))
  ;;     (if lang-hook
  ;;         (add-hook lang-hook #'tree-sitter-mode)
  ;;       (message "tree-sitter: %s not found in current emacs environment. Skipped" lang-hook-string))))
  )

;;; tree-sitter.el ends here
