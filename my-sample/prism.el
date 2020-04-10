;;; prism --- rainbow-delimiter but in blocks
;;; Commentary:
"rainbow-delimiters but in blocks"
;;; Code:

(use-package prism
  :hook ((json-mode)
         . prism-mode))

;;; prism.el ends here
