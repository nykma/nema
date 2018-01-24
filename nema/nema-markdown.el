;;; nema-markdown --- Markdown
;;; Commentary:
"markdown-mode enhancement"
;;; Code:

(use-package markdown-mode
  :ensure t)

(use-package apib-mode
  :mode
  ("\\.apib\\'" . apib-mode)
  :ensure t)

(provide 'nema-markdown)

;;; nema-markdown.el ends here
