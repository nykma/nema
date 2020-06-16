;;; beancount --- Beancount support
;;; Commentary:
"Beancount support"
;;; Code:

(use-package beancount
  :quelpa (beancount :fetcher url :url "https://raw.githubusercontent.com/beancount/beancount/master/editors/emacs/beancount.el")
  :mode
  ("\\.bean$" . beancount-mode))

;;; beancount.el ends here
