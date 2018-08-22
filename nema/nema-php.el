;;; nema-php --- PHP mode
;;; Commentary:
"PHP packages and configs"
;;; Code:

(use-package php-mode
  :defer t
  :config
  (eval-after-load 'php-mode '(require 'php-ext)))

(if nema-use-lsp
  ;; Follow https://github.com/emacs-lsp/lsp-php#php-language-server
  ;; for instructions of installing flixfbecker/language-server.
    (use-package lsp-php
    :after (php-mode lsp-mode)
    :quelpa (lsp-php :fetcher github :repo "emacs-lsp/lsp-php")
    :hook
    (php-mode . lsp-mode)
    (php-mode . lsp-php-enable)
    :config
    (setq
      lsp-php-language-server-command (list "php" (expand-file-name "vendor/bin/php-language-server.php" lsp-php-server-install-dir))
     ;; lsp-php-workspace-root-detectors '(lsp-php-root-composer-json lsp-php-root-projectile lsp-php-root-vcs ".dir-locals.el" ".project" "index.php" "robots.txt")
     lsp-php-show-file-parse-notifications t))

  ;; else
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
