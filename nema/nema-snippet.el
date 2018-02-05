;;; nema-snippet --- Snippets
;;; Commentary:
"YASnippet engine and snippets"
;;; Code:

(use-package yasnippet
  :ensure t
  :delight yas-minor-mode
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(provide 'nema-snippet)
;;; nema-snippet.el ends here
