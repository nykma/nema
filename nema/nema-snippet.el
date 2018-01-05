;;; nema-snippet --- Snippets
;;; Code:

(use-package yasnippet
  :ensure t
  :diminish (yas-mode . "Y")
  :config
  (add-hook 'after-init-hook '(yas-global-mode 1)))

(use-package yasnippet-snippets
  :ensure t)

(provide 'nema-snippet)

;;; nema-snippet.el ends here
