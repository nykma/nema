;;; nema-org --- Org
;;; Commentary:
"org-mode enhancement"
;;; Code:

(use-package htmlize
  :ensure t
  :defer t)
(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode))

(provide 'nema-org)

;;; nema-org.el ends here
