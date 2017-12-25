;;; nema-snippet --- Snippets
;;; Code:

(package-install 'yasnippet)
(package-install 'yasnippet-snippets)
(add-hook 'after-init-hook '(yas-global-mode 1))

(provide 'nema-snippet)

;;; nema-snippet.el ends here
