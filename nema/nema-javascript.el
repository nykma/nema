;;; nema-javascript --- JS and TS dev tools
;;; Commentary:
"JavaScript and TypeScript tools"
;;; Code:

(use-package js2-mode
  :ensure t
  :defer t
  :config
  (setq js2-strict-trailing-comma-warning nil)
  (setq js2-strict-missing-semi-warning nil)
  (setq js2-missing-semi-one-line-override nil)
  )

(defun nema/tide/setup ()
  "Setup process of tide.
See also: https://github.com/ananthakumaran/tide"
  (interactive)
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (tide-hl-identifier-mode t))

(use-package tide
  :ensure t
  :hook (typescript-mode . nema/tide/setup))

(use-package rjsx-mode
  :ensure t
  :mode "components\\/.*\\.js\\'")

(provide 'nema-javascript)

;;; nema-javascript.el ends here
