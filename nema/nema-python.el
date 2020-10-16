;;; nema-python --- PYTHON mode
;;; Code:

(unless nema-lsp
  (use-package elpy))

;; npm i -g pyright
(use-package lsp-pyright
  :if (eq nema-lsp 'lsp-mode)
  :hook (python-mode . (lambda () (require 'lsp-pyright) (lsp))))

(provide 'nema-python)

;;; nema-python.el ends here
