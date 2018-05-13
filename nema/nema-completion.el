;;; nema-completion --- Completion
;;; Code:

(use-package company
  :delight
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-tooltip-align-annotations t))

(provide 'nema-completion)

;;; nema-completion.el ends here
