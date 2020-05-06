;;; nema-tree-sitter --- Incremental parsing
;;; Commentary:
"Incremental parsing"
;;; Code:

(add-to-list 'package-archives '("ublt" . "https://elpa.ubolonton.org/packages/"))

(use-package tree-sitter)

(use-package tree-sitter-langs
  :config
  (global-tree-sitter-mode)
  (require 'tree-sitter-hl)
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
