;;; nema-haskell --- Haskell support
;;; Commentary:
"Haskell support"
;;; Code:

(require 'nema-customize-group)

(use-package haskell-mode)

(use-package lsp-haskell
  :if (eq nema-lsp 'lsp-mode)
  :hook ((haskell-mode . lsp)
         (haskell-literate-mode . lsp)))

(provide 'nema-haskell)

;;; nema-haskell.el ends here
