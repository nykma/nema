;;; nema-project --- Project management
;;; Code:

(use-package projectile
  :diminish (projectile-mode . "")
  :ensure t
  :config
  (projectile-mode))

(use-package counsel-projectile
  :ensure t
  :diminish (counsel-projectile-mode . "")
  :config
  (counsel-projectile-mode))

(provide 'nema-project)

;;; nema-project.el ends here
