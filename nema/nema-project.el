;;; nema-project --- Project management
;;; Commentary:
"Settings about projectile"
;;; Code:
;;; -*- lexical-binding: t -*-

(require 'nema-customize-group)

;; project-wide search
(use-package ag
  :if (executable-find "ag"))

(use-package rg
  :if (executable-find "rg"))

(use-package projectile
  :delight '(:eval
             (if (projectile-project-p)
         	 (concat " |" (projectile-project-name) "|")
               "")
             )
  :delight
  :config
  (setq projectile-file-exists-remote-cache-expire (* 10 60)
        projectile-enable-caching t
        projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory)
        projectile-switch-project-action 'projectile-commander)
  (projectile-mode)
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (projectile-register-project-type 'npm '("package.json")
                                    :compile "npm install"
                                    :test "npm test"
                                    :run "npm start")
  (projectile-register-project-type 'yarn '("yarn.lock")
                                    :compile "yarn"
                                    :test "yarn test"
                                    :run "yarn start")
  (projectile-register-project-type 'go '("go.mod")
                                    :compile "go build"
                                    :test "go test"
                                    :run "go run"))

(pcase nema-emacs-completion-engine
  ;; https://github.com/ericdanan/counsel-projectile
  ('ivy
   (use-package counsel-projectile
     :config
     (counsel-projectile-mode)))
  ('helm
   (use-package helm-projectile
     :config
     (helm-projectile-on))
   (use-package helm-ag :if (executable-find "ag"))
   (use-package helm-rg :if (executable-find "rg")))
  ('vertico
   (setq projectile-completion-system 'default)))

(provide 'nema-project)

;;; nema-project.el ends here
