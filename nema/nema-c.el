;;; nema-c --- C & C++ layer
;;; Commentary:
"C & C++ layer"
;;; Code:

;; (use-package cc-mode)

;; https://github.com/Andersbakken/rtags
(use-package rtags)
(if (fboundp 'company-mode)
    (use-package company-rtags))
(if (fboundp 'flycheck-mode)
    (use-package flycheck-rtags))
(if (fboundp 'ivy-mode)
    (use-package ivy-rtags))

(use-package cc-mode)
(use-package semantic
  :config
  (global-semantic-idle-scheduler-mode))

(provide 'nema-c)

;;; nema-c.el ends here
