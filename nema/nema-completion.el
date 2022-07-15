;;; nema-completion --- Completion
;;; Code:

(use-package company
  :delight
  :hook (after-init . global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
        company-tooltip-limit 20
        company-show-quick-access t
        company-idle-delay .2               ; decrease delay before autocompletion popup shows
        company-echo-delay 0                ; remove annoying blinking
        company-minimum-prefix-length 1
        company-require-match nil)

  (defun nema--company-backend-with-yas (backend)
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

;; Popup documentation for completion candidates
(use-package posframe)

(use-package company-posframe
  :quelpa (company-posframe :fetcher github :repo "tumashu/company-posframe" :files ("company-posframe.el"))
  :delight
  :config
  (company-posframe-mode 1))

;; Icons and fancies
(use-package all-the-icons)

;; prescient.el: simple but effective sorting and filtering for Emacs.
(use-package company-prescient
  :after (company)
  :config
  (company-prescient-mode t))

(provide 'nema-completion)

;;; nema-completion.el ends here
