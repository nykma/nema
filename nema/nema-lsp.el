;;; nema-lsp --- Language Server Protocol settings
;;; Commentary:
"Language Server Protocol settings"
;;; Code:

;; Main
(use-package lsp-mode
    ;; :delight
    :commands (lsp)
    :hook ((ruby-mode
            php-mode
            python-mode
            js-mode typescript-mode js2-mode rjsx-mode
            go-mode
            rust-mode
            ;; c-mode c++-mode objc-mode ;; <- handled in nema-c.el
            dart-mode
            elixir-mode
            java-mode
            ng2-html ng2-ts
            ) . lsp)
    :init
    (setq lsp-enable-snippet t
          lsp-auto-guess-root t
          lsp-response-timeout 20
          lsp-auto-configure t
          lsp-prefer-flymake nil ;; Prefer flycheck
          lsp-session-file (expand-file-name ".cache/lsp-sessions" user-emacs-directory)
          )
    :config
    (use-package lsp-java)
    (require 'lsp-clients))

;; Display LSP output
(use-package lsp-ui
  :after (lsp-mode)
  :commands (lsp-ui)
  :bind
  (:map lsp-ui-mode-map
        ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
        ([remap xref-find-references] . lsp-ui-peek-find-references)
        ("C-c u" . lsp-ui-imenu))
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq scroll-margin 0
        lsp-ui-doc-use-webkit (featurep 'xwidget-internal)))

;; LSP as completion backend
(use-package company-lsp
  :after (lsp-mode company)
  :commands (company-lsp))

;; Treemacs support
(if (fboundp 'treemacs)
    (use-package lsp-treemacs
      :commands lsp-treemacs-error-list))

;; Debugger
;; See https://github.com/yyoncho/dap-mode for usage
(use-package dap-mode
  :after (lsp-mode)
  :hook ((lsp-mode . dap-mode)
         (lsp-mode . dap-ui-mode))
  :config
  (setq dap--breakpoints-file (expand-file-name ".cache/dap-breakpoints" user-emacs-directory)))

;; Helm intergration
(if (eq nema-emacs-completion-engine 'helm)
  (use-package helm-lsp))

(provide 'nema-lsp)

;;; nema-lsp.el ends here
