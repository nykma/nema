;;; nema-javascript --- JS and TS dev tools
;;; Commentary:
"JavaScript and TypeScript tools"
;;; Code:

(use-package js2-mode
  :mode "\\.\\(js\\)\\'"
  :config
  (setq js2-mode-show-strict-warnings nil
        ;; js2-strict-trailing-comma-warning nil
        ;; js2-missing-semi-one-line-override nil
        ;; js2-strict-missing-semi-warning nil
        js2-mode-show-parse-errors nil) ;; use flycheck & ESLint instead
  )

(use-package typescript-mode
  :config
  ;; Typescript REPL
  ;; $ npm i -g tsun
  (use-package ts-comint))

;; Angular 2+ support
(use-package ng2-mode)

(use-package rjsx-mode
  :mode "\\.\\(jsx\\|tsx\\)\\'")

(use-package vue-mode
  :mode "\\.vue\\'"
  :config
  (setq mmm-submode-decoration-level 3)) ;; high coloring

(unless nema-use-lsp
  (defun nema/tide/setup ()
    "Setup process of tide.
See also: https://github.com/ananthakumaran/tide"
    (interactive)
    (tide-setup)
    ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (tide-hl-identifier-mode t))
  (use-package tide
    ;; :mode "\\.\\(ts\\)\\'"
    :hook (typescript-mode . nema/tide/setup)))

(provide 'nema-javascript)

;;; nema-javascript.el ends here
