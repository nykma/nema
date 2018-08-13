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
  (setq projectile-file-exists-remote-cache-expire (* 10 60))
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

;; (use-package counsel-projectile
;;   :config
;;   (counsel-projectile-mode)
;;   (define-key counsel-projectile-mode-map (kbd "C-c C-p") 'counsel-projectile-command-map))

(provide 'nema-project)

;;; nema-project.el ends here
