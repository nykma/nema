;;; nema-php --- PHP mode
;;; Commentary:
"PHP packages and configs"
;;; Code:

(use-package php-mode
  :mode "\\.php\\'"
  :config
  ;; (eval-after-load 'php-mode '(require 'php-ext))
  )

;; This package causes too much trouble
;; (use-package phpunit
;;   :no-require
;;   :commands (phpunit-mode)
;;   :hook (php-mode . phpunit-mode)
;;   :init
;;   (require 'phpunit-mode))

;; Follow https://github.com/emacs-lsp/lsp-php#php-language-server
;; for instructions of installing flixfbecker/language-server.
;; (use-package lsp-php
;;   :quelpa (lsp-php :fetcher github :repo "emacs-lsp/lsp-php")
;;   :hook ((php-mode . (lambda ()
;;                        (require 'lsp-php)
;;                        (lsp))))
;;   :config
;;   ;; (setq
;;   ;;  lsp-php-language-server-command (list "php" (expand-file-name "vendor/bin/php-language-server.php" lsp-php-server-install-dir))
;;   ;;  lsp-php-workspace-root-detectors '(lsp-php-root-projectile lsp-php-root-composer-json "index.php" "robots.txt")
;;   ;;  ;; lsp-php-workspace-root-detectors '(lsp-php-root-composer-json lsp-php-root-projectile lsp-php-root-vcs ".dir-localsn.el" ".project" "index.php" "robots.txt")
;;   ;;  lsp-php-show-file-parse-notifications t)
;;   ;; (with-eval-after-load "lsp-php"
;;   ;;   (add-hook 'php-mode-hook #'lsp))
;;   )
(unless nema-use-lsp
  (use-package php-extras
    :defer t
    :config
    (eval-after-load 'php-mode '(require 'php-extras)))
  (use-package ac-php)
  (use-package company-php
    :hook
    (php-mode . (lambda ()
                  (ac-php-core-eldoc-setup)
                  (make-local-variable 'company-backends)
                  (add-to-list 'company-backends 'company-ac-php-backend)))))

(provide 'nema-php)

;;; nema-php.el ends here
