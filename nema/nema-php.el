;;; nema-php --- PHP mode
;;; Code:

(use-package php-mode
  :ensure t
  :defer t
  :config
  (eval-after-load 'php-mode '(require 'php-ext)))

(use-package php-extras
  :ensure t
  :defer t
  :config
  (eval-after-load 'php-mode '(require 'php-extras)))

(provide 'nema-php)

;;; nema-php.el ends here
