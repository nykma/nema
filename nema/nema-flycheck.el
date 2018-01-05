;;; nema-flycheck --- syntax checker
;;; Code:

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode))

(provide 'nema-flycheck)
;;; nema-flycheck.el ends here
