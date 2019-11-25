;;; nema-python --- PYTHON mode
;;; Code:

(unless nema-use-lsp
  (use-package elpy))

(if nema-use-lsp
    (use-package lsp-python-ms
      :hook (python-mode . (lambda () (require 'lsp-python-ms) (lsp)))
      :config
      (setq lsp-python-ms-dir (expand-file-name ".cache/mspyls" user-emacs-directory)
            lsp-python-ms-executable (expand-file-name ".cache/mspyls/Microsoft.Python.LanguageServer" user-emacs-directory))))

(provide 'nema-python)

;;; nema-python.el ends here
