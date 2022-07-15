;;; beancount --- Beancount support
;;; Commentary:
"Beancount support"
;;; Code:

(require 'nema-customize-group)

(use-package beancount
  :quelpa (beancount :fetcher github :repo "beancount/beancount-mode" :files ("beancount.el" "COPYING"))
  :hook
  ((beancount-mode . (lambda () (setq-local electric-indent-chars nil)))
   (beancount-mode . outline-minor-mode))
  :mode
  ("\\.bean$" . beancount-mode)
  :config
  (if nema-lsp
      (add-hook 'beancount-mode-hook #'lsp)))

;;; beancount.el ends here
