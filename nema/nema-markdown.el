;;; nema-markdown --- Markdown
;;; Commentary:
"markdown-mode enhancement"
;;; Code:

(use-package markdown-mode
  :bind (:map markdown-mode-map
              ("C-c ." . org-time-stamp)))

(use-package apib-mode
  :mode
  ("\\.apib\\'" . apib-mode))

(provide 'nema-markdown)

;;; nema-markdown.el ends here
