;;; nema-flycheck --- Syntax checker
;;; Commentary:
"Syntax checker"
;;; Code:

(use-package flycheck
  :delight
  :init
  (setq flycheck-emacs-lisp-load-path 'inherit)
  :config
  (global-flycheck-mode))

(provide 'nema-flycheck)
;;; nema-flycheck.el ends here
