;;; nema-markdown --- Markdown
;;; Commentary:
"markdown-mode enhancement"
;;; Code:

(use-package markdown-mode)

(use-package apib-mode
  :mode
  ("\\.apib\\'" . apib-mode))

(provide 'nema-markdown)

;;; nema-markdown.el ends here
