;;; nema-snippet --- Snippets
;;; Commentary:
"YASnippet engine and snippets"
;;; Code:

(use-package yasnippet
  :ensure t
  :defer t
  :diminish (yas-global-mode . "")
  :config
  (add-hook 'after-init-hook '(yas-global-mode 1)))

(use-package yasnippet-snippets
  :ensure t
  :defer t)

(provide 'nema-snippet)

;;; nema-snippet.el ends here
