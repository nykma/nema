;;; nema-theme - Theme config

(package-install 'zenburn-theme)
(load-theme 'zenburn t)

;; UI - disable all UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(provide 'nema-theme)
;;; nema-theme.el ends here
