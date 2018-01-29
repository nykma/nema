;;; nema-completion --- Completion
;;; Code:

(use-package company
  :ensure t
  :delight
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-tooltip-align-annotations t))

(provide 'nema-completion)

;;; nema-completion.el ends here
