;;; nema-project --- Project management
;;; Code:


(use-package projectile
  ;; :delight '(:eval
  ;;            (if (projectile-project-p)
  ;;        	 (concat " |" (projectile-project-name) "|")
  ;;              "")
  ;;            )
  :delight
  :config
  (projectile-mode))

(use-package counsel-projectile
  :delight
  :config
  (counsel-projectile-mode))

(provide 'nema-project)

;;; nema-project.el ends here
