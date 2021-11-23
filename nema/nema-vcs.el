;;; nema-vcs --- Version control tools
;;; Commentary:
"Version control tools"
;;; Code:

;; magit - Magit git
(use-package magit
  :bind (("C-c g g" . magit-status)
         ("C-c g b" . magit-blame-addition)
         ("C-c g d" . magit-diff-buffer-file))
  :init
  (setq transient-history-file (expand-file-name ".cache/transient/history.el" user-emacs-directory)
        transient-levels-file (expand-file-name ".cache/transient/levels.el" user-emacs-directory)
        transient-values-file (expand-file-name ".cache/transient/values.el" user-emacs-directory))
  :config
  (setq magit-revision-show-gravatars t)
  ;; (setq magit-no-confirm t)
  )

;; Connsuming too much CPUs
;; (use-package magit-todos
;;   :hook ((magit-mode . magit-todos-mode)))

;; Intergration with GitHub / GitLab / BitBucket / Gitea / Gogs
;; See my-sample/forge.el for usage
(use-package forge
  :config
  (setq forge-database-file (expand-file-name ".cache/forge-database.sqlite" user-emacs-directory)))

(use-package magit-gitflow
  :after (magit)
  :hook ((magit-mode . turn-on-magit-gitflow)))

(use-package diff-hl
  :hook ((dired-mode . diff-hl-dired-mode-unless-remote)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode))

(use-package magit-delta
  :delight
  :if (executable-find "delta")
  :hook ((magit-mode . magit-delta-mode))
  :config
  (setq magit-delta-delta-args
        '("--max-line-distance" "0.6" "--24-bit-color" "always" "--color-only" "--no-gitconfig")))

(provide 'nema-vcs)
;;; nema-vcs.el ends here
