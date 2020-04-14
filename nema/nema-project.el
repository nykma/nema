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
  (setq projectile-file-exists-remote-cache-expire (* 10 60)
        projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  (projectile-mode)
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (projectile-register-project-type 'npm '("package.json")
                                    :compile "npm install"
                                    :test "npm test"
                                    :run "npm start")
  (projectile-register-project-type 'yarn '("yarn.lock")
                                    :compile "yarn"
                                    :test "yarn test"
                                    :run "yarn start"))

(pcase nema-emacs-completion-engine
  ;; ('ivy (use-package counsel-projectile
  ;;         :config
  ;;         (counsel-projectile-mode)))
  ('helm (use-package helm-projectile
           :config
           (helm-projectile-on))
         (use-package helm-ag)
         (use-package helm-rg)))

(provide 'nema-project)

;;; nema-project.el ends here
