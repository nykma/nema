;;; nema-php --- PHP mode
;;; Commentary:
"PHP packages and configs"
;;; Code:

(use-package php-mode
  :defer t
  :config
  (eval-after-load 'php-mode '(require 'php-ext)))

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
                (add-to-list 'company-backends 'company-ac-php-backend))))
;; (use-package ac-php)
;; (if (fboundp 'company-mode)
;;     (use-package company-php
;;       :hook (php-mode . (lambda ()
;;                           (ac-php-core-eldoc-setup)
;;                           (add-to-list 'company-backends 'company-ac-php-backend)))
;;       :config
;;       (ac-php-core-eldoc-setup)
;;       (make-local-variable 'company-backends)
;;       (add-to-list 'company-backends 'company-ac-php-backend)))

(provide 'nema-php)

;;; nema-php.el ends here
