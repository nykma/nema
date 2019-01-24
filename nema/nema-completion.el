;;; nema-completion --- Completion
;;; Code:

(use-package company
  :delight
  :hook (after-init . global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-tooltip-limit 12
        company-idle-delay .2               ; decrease delay before autocompletion popup shows
        company-echo-delay 0                ; remove annoying blinking
        company-minimum-prefix-length 2
        company-require-match nil)
  (defun nema--company-backend-with-yas (backend)
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet)))
  ;; Popup documentation for completion candidates
  (use-package company-quickhelp
    ;; :bind (:map company-active-map
    ;; ("M-h" . company-quickhelp-manual-begin))
    :hook (global-company-mode . company-quickhelp-mode)
    :config (setq company-quickhelp-delay 0.5)))

(when nema-use-lsp
  (require 'nema-lsp))

(provide 'nema-completion)

;;; nema-completion.el ends here
