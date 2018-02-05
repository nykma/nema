;;; nema-web --- WEB mode
"Web packages and settings"
;;; Code:

(use-package web-mode
  :mode "\\.\\(erb\\)\\'")

(use-package emmet-mode
  :delight
  :hook ((sgml-mode css-mode web-mode rjsx-mode) . emmet-mode))

(provide 'nema-web)

;;; nema-web.el ends here
