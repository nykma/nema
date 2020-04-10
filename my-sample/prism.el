;;; prism --- rainbow-delimiter but in blocks
;;; Commentary:
"rainbow-delimiters but in blocks"
;;; Code:

(use-package prism
  :hook ((json-mode
          emacs-lisp-mode
          lisp-mode)
         . prism-mode))

;;; prism.el ends here
