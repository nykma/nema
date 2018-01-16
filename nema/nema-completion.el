;;; nema-completion --- Completion
;;; Code:

(use-package company
  :ensure t
  :diminish (company-mode . "")
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'nema-completion)

;;; nema-completion.el ends here