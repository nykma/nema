;;; beancount --- Beancount support
;;; Commentary:
"Beancount support"
;;; Code:

(use-package beancount
  :quelpa (beancount :fetcher github :repo "beancount/beancount" :files ("editors/emacs/beancount.el"))
  :mode
  ("\\.bean$" . beancount-mode))

;;; beancount.el ends here
