;;; nema-python --- PYTHON mode
;;; Code:

(unless nema-lsp
  (use-package elpy))

(use-package lsp-pyright
  :if (eq nema-lsp 'lsp-mode)
  :hook (python-mode . (lambda () (require 'lsp-pyright) (lsp))))

(provide 'nema-python)

;;; nema-python.el ends here
