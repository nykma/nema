;;; nema-python --- PYTHON mode
;;; Code:

(if nema-use-lsp
    ;; Python support for lsp-mode using pyls.
    ;; Install: pip install python-language-server
    (use-package lsp-python
      :commands lsp-python-enable
      :hook (python-mode . lsp-python-enable))

  ;; else
  (use-package elpy))

(provide 'nema-python)

;;; nema-python.el ends here
