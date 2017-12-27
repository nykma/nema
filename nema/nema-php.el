;;; nema-php --- PHP mode
;;; Code:

(use-package php-mode :ensure t)

(eval-after-load 'php-mode
  '(require 'php-ext))

(provide 'nema-php)

;;; nema-php.el ends here
