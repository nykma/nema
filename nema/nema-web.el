;;; nema-web --- WEB mode
"Web packages and settings"
;;; Code:

(use-package web-mode
  :mode "\\.\\(erb\\)\\'")

(use-package emmet-mode
  :delight
  :hook ((sgml-mode css-mode web-mode rjsx-mode) . emmet-mode))

(use-package pug-mode)

(use-package css-mode)
(use-package scss-mode)
(use-package less-css-mode)

(provide 'nema-web)

;;; nema-web.el ends here
