;;; company-tabnine --- Tabnine backend for company
;;; Commentary:
"Tabnine backend for company"
;;; Code:

(use-package company-tabnine
  :config
  (push '(company-tabnine company-capf) company-backends))

(provide 'company-tabnine)

;;; company-tabnine.el ends here
