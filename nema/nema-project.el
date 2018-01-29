;;; nema-project --- Project management
;;; Code:


(use-package projectile
  :delight '(:eval
	     (if (projectile-project-p)
		 (concat " |" (projectile-project-name) "|")
	       "")
	     )
  :ensure t
  :config
  (projectile-mode))

(use-package counsel-projectile
  :ensure t
  :delight
  :config
  (counsel-projectile-mode))

(provide 'nema-project)

;;; nema-project.el ends here
