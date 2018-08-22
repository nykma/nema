;;; nema-go --- Go modules
;;; Commentary:
"Go modules"
;;; Code:

(use-package go-mode)

(if nema-use-lsp
    ;; Install:
    ;; go get -u github.com/sourcegraph/go-langserver
    (use-package lsp-go
      :functions (lsp-go-enable)
      :hook (go-mode . lsp-go-enable)))

(provide 'nema-go)

;;; nema-go.el ends here
