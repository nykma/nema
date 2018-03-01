;;; nema-vcs --- Version control tools
;;; Commentary:
"Version control tools"
;;; Code:

;; magit - Magit git
(use-package magit
  :bind (("C-c g g" . magit-status))
  ;; :config
  ;; (setq magit-no-confirm t)
  )

(use-package magit-gitflow
  :hook ((magit-mode . turn-on-magit-gitflow)))


(provide 'nema-vcs)
;;; nema-vcs.el ends here
