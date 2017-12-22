;;; nema-flycheck --- syntax checker
;;; Code:

(package-install 'flycheck)

(add-hook 'after-init-hook 'global-flycheck-mode)
(provide 'nema-flycheck)
;;; nema-flycheck.el ends here
