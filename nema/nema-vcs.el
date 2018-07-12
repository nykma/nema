;;; nema-vcs --- Version control tools
;;; Commentary:
"Version control tools"
;;; Code:

;; magit - Magit git
(use-package magit
  :bind (("C-c g g" . magit-status)
         ("C-c g b" . magit-blame))
  ;; :config
  ;; (setq magit-no-confirm t)
  )

(use-package magit-gitflow
  :hook ((magit-mode . turn-on-magit-gitflow)))

(use-package diff-hl
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode-unless-remote)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(provide 'nema-vcs)
;;; nema-vcs.el ends here
