;;; nema-snippet --- Snippets
;;; Commentary:
"YASnippet engine and snippets"
;;; Code:

(use-package yasnippet
  :delight yas-minor-mode
  :config
  (yas-global-mode 1)
  (use-package yasnippet-snippets)
  (setq yas-snippet-dirs `(,(concat user-emacs-directory "my/snippets") ,yasnippet-snippets-dir)))

;; Temporarily generate and use snippets
(use-package auto-yasnippet
  :bind
  (("C-c & w" . aya-create)
   ("C-c & y" . aya-expand))
  :config
  (setq aya-persist-snippets-dir (concat user-emacs-directory "my/snippets")))

(provide 'nema-snippet)
;;; nema-snippet.el ends here
