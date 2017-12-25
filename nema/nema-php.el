;;; nema-php --- PHP mode
;;; Code:

(package-install 'php-mode)

(eval-after-load 'php-mode
  '(require 'php-ext))

(provide 'nema-php)

;;; nema-php.el ends here
