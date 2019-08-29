;;; nema-evil --- Evil settings
;;; Commentary:
"Evil settings"
;;; Code:

(use-package evil
  :init
  (setq evil-want-intergration t
        evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(provide 'nema-evil)

;;; nema-evil.el ends here
