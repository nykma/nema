;;; nema-appearance --- Appearance config
;;; Code:

(package-install 'hc-zenburn-theme)
(load-theme 'hc-zenburn t)

;; UI - disable all UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(provide 'nema-appearance)

;;; nema-appearance.el ends here
