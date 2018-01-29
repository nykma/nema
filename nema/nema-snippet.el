;;; nema-snippet --- Snippets
;;; Commentary:
"YASnippet engine and snippets"
;;; Code:

(use-package yasnippet
  :if (not noninteractive)
  :ensure t
  :delight yas-minor-mode
  :commands (yas-global-mode yas-minor-mode)
  :config
  (progn
    (setq yas-indent-line nil)))

(use-package yasnippet-snippets
  :ensure t)

(provide 'nema-snippet)
;;; nema-snippet.el ends here
